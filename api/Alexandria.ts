import { BigNumber, ethers, providers } from "ethers";
import contract from "./Alexandria_abi.json";

const contractAddress = "<DEPLOYED_CONTRACT_ADDRESS_HERE>";
const abi = contract;

export default class Alexandria {
  alexandria: any;

  constructor(provider: providers.Web3Provider) {
    this.alexandria = new ethers.Contract(contractAddress, abi, provider);
  }

  async createHypothesis(_url: string) {
    return await this.alexandria.createHypothesis(_url);
  }
  

  async getHypotheses(offset: BigNumber, limit: BigNumber) {
    return await this.alexandria.getHypotheses(offset, limit);
  }
  

  async getHypothesis(id: BigNumber) {
    return await this.alexandria.getHypothesis(id);
  }
  

  async getProofsForHypothesis(hypothesesID: BigNumber) {
    return await this.alexandria.getProofsForHypothesis(hypothesesID);
  }
  

  async getReviewsForProof(hypothesesID: BigNumber, proofIndex: BigNumber) {
    return await this.alexandria.getReviewsForProof(hypothesesID, proofIndex);
  }
  

  async hypotheses(: BigNumber) {
    return await this.alexandria.hypotheses();
  }
  

  async proofs(: BigNumber, : BigNumber) {
    return await this.alexandria.proofs(, );
  }
  

  async reviews(: BigNumber, : BigNumber, : BigNumber) {
    return await this.alexandria.reviews(, , );
  }
  

  async submitProof(hypothesesID: BigNumber, _url: string, proofResult: BigNumber) {
    return await this.alexandria.submitProof(hypothesesID, _url, proofResult);
  }
  

  async submitReview(hypothesesID: BigNumber, proofIndex: BigNumber, _url: string, reviewResult: BigNumber) {
    return await this.alexandria.submitReview(hypothesesID, proofIndex, _url, reviewResult);
  }
  
}