class Hello extends React.Component {
  render() {
    return <div>Hello {this.props.name}</div>;
  }
}

ReactDOM.render(
  <Hello name="World" />,
  document.getElementById('container')
);


class Form extends React.Component {
  render() {
    var addresses = this.props.app.addresses.map(function(address, i) {
      return (
        <li key={i}>
          {JSON.stringify(address)}
        </li>
      );
    });
    
    return (
      <div>
        Input zip code: 
        <input type="text" size="10" value={this.props.app.zip_code} onChange={this.onChangeZipCode.bind(this)} />
        <button onClick={this.onSearchStart.bind(this)}>search address</button>
        
        <ol>
          {addresses}
        </ol>
      </div>
    );
  }
  
  onChangeZipCode(e) {
    this.props.app.updateZipCode(e.target.value);
  }
  
  onSearchStart() {
    this.props.app.searchAddress();
  }
}

class Application {
  constructor() {
    this.observers = [];
    this.zip_code = "6000000";
    this.addresses = [];
  }
  
  on(cb) {
    this.observers.push(cb);
  }
  
  notifyUpdate() {
    for (var i=0; i < this.observers.length; ++i) {
      this.observers[i]();
    }
  }
  
  updateZipCode(zip) {
    this.zip_code = zip;
    this.notifyUpdate();
  }
  
  searchAddress() {
    const app = this;
    ZipCodeJp.getAddressesOfZipCode(
      app.zip_code,
      function(err, addresses) {
        app.addresses = addresses;
        app.notifyUpdate();
      }
    );
  }
}

class Renderer {
  constructor(app) {
    this.app = app;
  }
  
  render() {
    ReactDOM.render(
      <Form app={this.app} />,
      document.getElementById('container')
    );
  }
}

const app = new Application();
const renderer = new Renderer(app);
app.on(function() {
  renderer.render();
});

app.notifyUpdate();