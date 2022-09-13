import { BigNumber, ethers, providers } from "ethers";
import contract from "./Alexandria_abi.json";

const contractAddress = "<DEPLOYED_CONTRACT_ADDRESS_HERE>";
const abi = contract;

export default class Alexandria {
  alexandria: any;

  constructor(provider: providers.Web3Provider) {
    this.alexandria = new ethers.Contract(contractAddress, abi, provider);
  }

  async createHypothesis(_uri: string) {
    return await this.alexandria.createHypothesis(_uri);
  }
  

  async getHypotheses() {
    return await this.alexandria.getHypotheses();
  }
  

  async getHypothesis(id: BigNumber) {
    return await this.alexandria.getHypothesis(id);
  }
  

  async hypotheses(: BigNumber) {
    return await this.alexandria.hypotheses();
  }
  

  async reviews(: BigNumber, : BigNumber) {
    return await this.alexandria.reviews(, );
  }
  

  async submitReview(id: BigNumber, uri: string) {
    return await this.alexandria.submitReview(id, uri);
  }
  
}