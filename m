Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033038;
	b=VLLP7ivvFUJqiLy8A7+C/wGRCbIYj/sZurbtI7iXa4zX2pSgpkXGdARB+M5n8vouRdjw
	 kcc0moRfCCOnfpxk9pODumUotiT3ANJ7i4RdiIcQpb7T3w7koxjbSKptixB5ys+NijHJX
	 9mHjZ3RA1I8ZWtIQgndK9qgcEZjhxmk76M5Wor4Ep+qtzqm7ILq30TRuNfubMHkEcXz3X
	 Xo98W4tKSQMvn9zaTAxOPAjCX2HOvd7ouEGJEn+zbkLUyHqLg0RgZZP/xlC1F7fFrpw5s
	 h/jMGTwyROCuhwSy0V4Pnti93NcIygqf5ZiCEf3B846mSAv5ThdDCk00FFv6+osv+VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033038;
	h=DMARC-Filter:Received:Received:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=1KQDr5H5ZrXqE2xwfRsz5JEYdHKQpCphTBwxeeuDpAo=;
	b=n0RlVVsMfU9BxHh1je3WhKQRx7X22c9lrCGvDinhhIhbTfO8OI/l18G+vCJGjltZnYp1
	 N28puYcfTQ3Si02dhskx3FovL6gpftLoU5VA7XFcdEeoCZ+YAy7IU8zWsd9gwJWma5q6L
	 uR/IeyrgXKsPbjkvry2eZUIMVTeOBx9i9F56k48/4nHa3serOjKLt3HEYQ7BRqzXYhztx
	 0n1ppptoXbupUsWTEkroDj3VOxNSCAdIwKjCY3I6tjp52Px+yxm+wKFrKxrYUPvUuPKuS
	 q5yvdfShJRk3cGINN0PmhjvAD5vc/hJyz6GI/u+5iUVWa0AJtBUJ+sulUmUFu0AfGOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.16
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F838606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F838606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id D6EA0C04CB;
	Wed, 18 Nov 2026 20:17:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 519622002B;
	Wed, 18 Nov 2026 20:17:15 +0000 (UTC)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 12:17:15 -0800
From: Joe Perches <joe@perches.com>
To: HONG Yifan <elsk@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft
 <apw@canonical.com>, kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] checkpatch: externalize function-like type macros
In-Reply-To: <20261118193921.683813-1-elsk@google.com>
References: <20261118193921.683813-1-elsk@google.com>
Message-ID: <74682668f673185570e7ea4be4b73c01@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 519622002B
X-Stat-Signature: qup9be5a19o1eggzhur3x1cuztufujyo
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/77YQx6jf67Vdoyec3r8ni5Zvz2xuH0EQ=
X-HE-Tag: 1795033035-87232
X-HE-Meta: U2FsdGVkX1/cqwlvWWbbm6T2NexWgE1darfW6nqUYl2ql2b1dGaXhYzR15zQclYXi0CL9u+eao9t+n13wIiOTao6nfmSgmQyM9kA1ujgt/MPFyFWBMScFfeIfO442+lh5FyRB1zLZMECoczgfERzlkkc0vEfF7WhPuNj0/ZJf77ifDJTKfi53U9W6/enutbfVjDv9QwgW7i0KudySNDgf+83KLg0I4USnCqkMaIvZYB98TUzjSwTmfpv26vD35ULxusJ2ffFGIPcj+mWSlmL5Q==

On 2026-11-18 11:39, HONG Yifan wrote:

> Following scripts/const_structs.checkpatch in commit bf1fa1dae68e
> ("checkpatch: externalize the structs that should be const"), read
> additional function-like type macro names from a new companion file
> scripts/type_macros.checkpatch into $type_macros (named to mirror
> $const_structs/$conststructsfile and initialized with the built-in
> typeof and __typeof__ keywords) and use $type_macros in $NonptrType and
> $NonptrTypeWithAttr.

Yes like this.

I'll test it before i ack it tomorrow.

Thanks,  Joe
