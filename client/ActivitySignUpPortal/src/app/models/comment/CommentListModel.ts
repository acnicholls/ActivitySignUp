import { Deserializable } from '../deserializable.model';


export class CommentListModel implements Deserializable{
    commentorId: number | undefined;
    commentDetail: string | undefined;
    commentContent: string | undefined;
    constructor(

    ){}

    deserialize(input: any): this {
        Object.assign(this, input);
        return this;
    }
}