Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083542;
	b=KXZ8YAdDQ1xtV5JWu4AokLdLl5lsFzh4yQL4qDe22Eb7Z+dGNUGS4A9ZelKQHxN6MAp8
	 nNBDkWGsLaTMvBQ3Snn+A9wJtff7GiCHA3bNmjweDVUYAC5ePYMglvvIHbr7HdOxBwQ1C
	 d8gQjjZMoeXaURzP/72nat5wkcCw48Ck8aIhXny0a1rf7vW9AOwZljIohgKjIfABkOK8S
	 4wcUVjqGjt4FxMO976Cx41vIF7BdFrNZN1S62zNYdAjE8adD4rcpkqP2g67AWRQLnOyND
	 L6hzmvrV3c8cvh3iRbKEkkOfb9hvfLns/8lMNZV89F4qsG/aBtT4t5cqfbfWwGqGiFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083542;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=FeryVqud6dMZkNfn8zKXkiXJSGWxThktDfDZczQxMD4=;
	b=O3eBlplQbfZsDXKgmz4JX/AtFVjpYiEW2uIUnMTqaHa1x+K3vZYxSxyQE4DJc/FF0xeI
	 IZf1LmoV9YFt1KtTFJadu1okouZl7jBEWMbzEENd4EcI2XqjfLOie7qJXuMZBr4k9aHhL
	 c+26P+pIl4oexmG/GywsKeWHfowTSzbnvSZVsR0FKFrpAzX/vVxgNN7bI55qmmdUw6GjQ
	 YSJvmLnhimqSq1opcsbyhf30ND2nCF7vpMhoeoVeZNsV8ecQpdIppWX59RbVxRfb++hsM
	 yaYkh0D0leQPt5ydg6bndvzmASLrXUkB5AUslqqJheva65Jgwa0HgNybXPXRm1qdEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B4cYlQmY;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640F606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3640F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B4cYlQmY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5AEA9C4CBEF;
	Thu, 19 Nov 2026 10:19:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15FF260237;
	Thu, 19 Nov 2026 10:19:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30E9111BC0538;
	Thu, 19 Nov 2026 11:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795083535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=FeryVqud6dMZkNfn8zKXkiXJSGWxThktDfDZczQxMD4=;
	b=B4cYlQmYp/dw6yL3qQZzV7HRlK3dtJqO3Y7qwTTfEZC0XOGuazijPH6AcAEFK9pH2xlImG
	OQIHHyAoXtqULMw4mwWZ02I6/4LLhoFFFU6TDP+QMDG1VSad039YHc/yaFvlHt/iB1oeBD
	Bw96kcsNS4o2phBlg1UTGRhlkcN+Tv5XKJy72FB4sldIglGST5giRTvniJMKbWg9BPDkMs
	PN9gbzwdhwo+HqvqiVNOVXuxuf1XSEG1UVGPf82eubhHsTW5hzuoqwYbWfUequtYbmuqBB
	ARHo1LRbajyFROuC0D/9ZqnjVaqAZ+OpSY8nRMl1O2tg1j9radHQhjB5kSw+/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Gleixner <tglx@kernel.org>,  "Artem B.
 Bityuckiy" <dedekind@infradead.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
In-Reply-To: <CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
	(James Hilliard's message of "Thu, 19 Nov 2026 02:35:26 -0700")
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
	<87fqwyjwvk.fsf@bootlin.com>
	<CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
	<87ld6pfc75.fsf@bootlin.com>
	<CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 11:18:52 +0100
Message-ID: <87tslddsz7.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


>> >> I would prefer if you could write your own commit logs, giving us more
>> >> confidence on the work that has been asked. You can use an LLM to
>> >> improve/enhance it obviously.
>> >
>> > To be honest I've never been great at writing commit messages in
>> > general and have gotten a lot more complaints about commit messages
>> > missing important details prior to using LLM's. I can barely tell the
>>
>> For me the code is getting better but the commit logs are unclear. Some
>> details which don't need (imo) to be written are there, and the big
>> picture is often missing or not clearly stated before the details.
>>
>> Don't get me wrong, using an LLM to refine/reword/reorganize is fine,
>> but letting the LLM write it entirely is not working well.
>
> I guess the issue is that I often don't have the best understanding
> of what the big picture that needs explanation in the commit messages
> is some of the time, if I did then I would then just instruct the LLM to
> make those edits whenever I review patches before sending them.
>
> I think I just don't have good intuition when it comes to predicting what is
> important to explain in commit messages.

I get it, but for someone submitting this many patches, that lack of
understanding is precisely the problem: delegating the wording to an LLM
when you don't know the rationale doesn't remove the cost, it just
shifts it onto others.
