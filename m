Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077511;
	b=XvBB5HI1xkOpahcOyMboTU6yaF4krkRkC+mKzR2o7utq7895ON2jeOtT1f7L7wu+o1VL
	 FT517mZ5SaNHAmRbLr2EnN0H3tn4mPQCDmZZkD/OqC0zRUzLFaM8VTgXQJ5FvYtVJMJBp
	 6/QaLEucYYoETw0wHXpGjszhI+Vf7XKQICuUKQ9pm4NYASqpLB3TMTgKg+EIsrOy/BtFW
	 1FWKRpuZ8S7Sb/eviVj6ysuNxSyT/vOTuUW5G/fOkO9nrKSQLyH8f8lQmaMw2mXQC8l4x
	 lyqi6em+kIOE3XhXEEi67C6WoYSF3eH9lYyb25FbhI9r+rCPkwq89JTbBnvkyadqfXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077511;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=y7giRJK3oXv6VpWz+JWM+SHr02QwlAVQHEppMzZGWGk=;
	b=hdHdM5ki7cT1AWlFUcqaY2BWF8/9ETXStBEnu0oyUOwuvfgvVWYZ1726ud6gUxYemK72
	 FUHtiGPcN925aqLZsznmKg7tA8Www7WlNOQft+iI+0du8w4n3htUFXwCQJWTluXDP4J7f
	 1HIg64Zaec1CTvYYr6HjSdAIq7BN2FQPLFIoQT37Z+xBqxqBXSqh2zMIIs3wDNruVQ8iO
	 79te4Neo2LQCp9yoGRjAEUvgHyukXDp/yGXgG335W8f/7IMNCeJ3S7vDbjUyeuDKSNkL0
	 5vJdxARiuVw7z0LyzmUo928TKxOLwWIVTZLLRn/b4QGmF/b/usC4sLUXtxv7SYzRHDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b8hUMxM1;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64309606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64309606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b8hUMxM1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE6AA4E4164B;
	Thu, 19 Nov 2026 08:38:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3E9360237;
	Thu, 19 Nov 2026 08:38:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F48511BC31E4;
	Thu, 19 Nov 2026 09:38:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y7giRJK3oXv6VpWz+JWM+SHr02QwlAVQHEppMzZGWGk=;
	b=b8hUMxM1GUNq2+W5SyznPCQr6RSQ485GHmvjqSy42XakEY4U5SYETUB/wUFOPN1qkrOfU+
	/0oD8pctkLmW2Q5dt+p3NyDbpHRMUUo/joNGKxeIIDbFxBdlOrequYK8aGj1IVLOdiomwV
	SmKH0TTiSlukX5/Z/TIPfAjbwIPM7QDRW2Jg4agUCQLxjHRr1ehKaieoXn5TcZrvt+t20J
	5pOO2cm4Gl0Ul62pRPP8X1xdzohuITi/7YaRMci6wHkdlQiZ/1Ip1xlAvmPhTpIjP1j2U5
	a8Kq2WVWtWqK83iZ+jNADB+RmnLcpf3hTlO62RK8HSFeM59+UUSo598fDYlWAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Gleixner <tglx@kernel.org>,  "Artem B.
 Bityuckiy" <dedekind@infradead.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
In-Reply-To: <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
	(James Hilliard's message of "Wed, 18 Nov 2026 12:11:19 -0700")
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
	<87fqwyjwvk.fsf@bootlin.com>
	<CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 09:38:22 +0100
Message-ID: <87ld6pfc75.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2026 at 12:11:19 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> On Wed, Nov 18, 2026 at 2:45=E2=80=AFAM Miquel Raynal <miquel.raynal@boot=
lin.com> wrote:
>>
>> On 03/11/2026 at 22:52:39 -07, James Hilliard <james.hilliard1@gmail.com=
> wrote:
>>
>> > create_bbt() returns an error if reading a bad-block marker fails,
>>
>> This sentence does not mean anything.
>>
>> > but
>> > check_create() ignores that result. It can assign version 1 to the
>>
>> That's also unclear.
>
> It's just stating where an unchecked return exists along with the
> potential consequences of continuing without checking the return.
> At least that was how I read it.
>
> Is this commit message phrasing/style weird or something?

See just below one example:

>> > incomplete RAM table and write it to the primary and mirror
>>locations.

"the primary and mirror locations" -> this is a detail, that's not what
matters.

>> > Unscanned factory-bad blocks then appear good in the persisted
>> > tables.
>>
>> Here is a proposal which I believe makes more sense:
>>
>> mtd: rawnand: abort BBT creation on scan failure
>>
>> create_bbt() can fail on a non-ECC OOB read error, leaving the RAM BBT
>> partially populated. It is preferable to bail out early rather than bump
>> the table versions and write incomplete primary and mirror tables, which
>> would mark the unscanned factory-bad blocks as good.
>
> Personally I try to avoid terminology like "preferable" when
> describing

Yes, fine.

> code behavior that's clearly wrong, as "preferable" to me at least weakly
> implies that the code issue being fixed could be more of a style issue
> rather than a correctness issue.
>
> To me both commit messages seem to be equally understandable.
>
>>
>> > Propagate the scan failure before changing table versions or writing
>> > either copy. Keep explicit NAND_BBT_CREATE_EMPTY initialization unchan=
ged.
>> >
>> > Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block=
 scan")
>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>
>> I would prefer if you could write your own commit logs, giving us more
>> confidence on the work that has been asked. You can use an LLM to
>> improve/enhance it obviously.
>
> To be honest I've never been great at writing commit messages in
> general and have gotten a lot more complaints about commit messages
> missing important details prior to using LLM's. I can barely tell the

For me the code is getting better but the commit logs are unclear. Some
details which don't need (imo) to be written are there, and the big
picture is often missing or not clearly stated before the details.

Don't get me wrong, using an LLM to refine/reword/reorganize is fine,
but letting the LLM write it entirely is not working well.

Thanks,
Miqu=C3=A8l
