Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795080939;
	b=YDOa8hc5nm1OPQqb3uEqTZg6TRYtP/NgoYrhNoxMWx+BLT/GuqprwrQ8vrJVV3y7Lnme
	 V15bUGkxDqwfTpo0TQBPi6U/wHIFULvpxm2XQXOREzuv1sZli8JnH2Ri7ka7e9Ze0+BvF
	 V8Z501jnJHOs+ZjE95NpCdyBfzdJes/UrKjX0GGIL5NMFWP671imkSwX7TSh+xQdjhDUR
	 TGbG+rB2MgHXkl4eMuKHnivfZYFJLS6/w4ggr+5vzU6u4TUOJN9FLDdxXmkPHeyG8ORYh
	 RVPJip0+2SCSUrtfHuTLCZsKTc9apkyaLePQWKLc22SraW4oya/z1XMuOjcoV3nB1OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
	b=zoWyoWd+e5pFRMEqWAPNZ6wwc+RUzzzfADQx54UMx3aYVa+gEYTpCi2lxhbrDgvopSq1
	 CvuhvHOLLluFacsUtlxDl0dLSSnPOaBn+kWY8Vsn3o6N39W/jBfR8APDVipXNbByoHVeO
	 xowon2N1lGvRCv7Mte5SD2WGllaJofzHSygrwWT5HsstBSlhb7t2LqQlZ1Wz4XbXC7nva
	 7lkGskhXNudDvm2z3+5FUh3L5TieQ/WOtnEVDTbEGO7g3s5gJ+blW55Kv1Icmls8SfsHe
	 p/VgOAXhY3ZyJIsIFi7ABWrYKH8TJcKxXmSaGjvklnioJHp5kBUFE749W13PZNW3img==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WF3h2Pe2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165560A2603
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1165560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WF3h2Pe2
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1196368241.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795080938; cv=none;
        d=google.com; s=arc-20260327;
        b=g5W5LOHSl3cEkG87NLrN++KHARLHS+bmShQKS0C3VkE+hfiYtWMEmhppno/vdd2jXJ
         PjBv5Ef5LSC6MrPHbqhY/mnimAGHfDT2eu1E8MUhfjefH4R5wcdZ1XexmHDj3vBvqzRV
         AzdaVQhRSmcGNswTFxLJpbJYPsalf0mlHK2Bmwq67TYEEfacbuTrD2Q8yuCrIYBoaup7
         96bFqB5YN/+ChSWdDgC8QLpkKYE2pE7Sdrpxw6bKLm5O6xS3Xg3kN23KDcD/gjt3zysX
         zJ+EbOHTcTSm/MuoBw1zRYX47F6dPyGfjK3csRQv+sZw7YSHaVeoYW71z4W8nVhDqwjw
         QS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
        fh=X9rKlfe+mz0d4QCdbSuqbZQ/q8ZAy8bQcHLvjvIhY4A=;
        b=rHERGcj/qWuvLyvUJSloYD5p1kROW6A3A+s5SuZJv34UVFdunco0uPTqVLm+SPUZom
         DNFIWy/mo3Upj3raHqThL53M2P3c/ZhXxlZ1jqVxSmrDgPsYbWbvGZmR5y21tmzOjDyC
         QPVY9pdPLCUkCBxBG7OZgXs38zrsHLqnEq6kdu/ixrApznPdjbJUNEktVq6pZ2EUv4+h
         Kc8LZLszla8YewTEmPEYRhq2nqHVb84XLf/YgjbCO/QGluEyDGKwMgQ+uqvC6f4zMrOX
         FqIaq04l0WtnvuttN4nl2tA31/GN3W6I5SGd2N5WVjFaJeaSKRi9qmjXQKs3cqJQ7M9M
         5dTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080938; x=1795685738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
        b=WF3h2Pe20uMSFXI32s42kMUAaPAh2RLkpFyxYC21NgQydUwTWumHxyDL1NqkE69JkS
         YQ/vn+evlSEZ8FkTLyge1PeXLtsoLmWjVWgWbrqtOKFzJPX4HMhRlnTvBiUrxO+igea9
         UYRfLuuOafYp4B8JVwOhEwW7MNJgqz/c+RD2NzCN1DvF0o0hIRYtZ61yWGqr1g0YWMBK
         sW8S+U4zWshCDrbqgyjbgO6273xg3XQogH1HaMNpHimCDkPnFboDDdwW1ghSa9MDJnHD
         jrradU8uYzjwMuXHX9uZzDxwZTftKFALnrtzla6CqtaM0WrgOGo/PLS+WkXnphroFsrH
         smDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080938; x=1795685738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQ5drq+cXIVqaOh2ZOnKiQMvAcJvt7/Sbd1bQ0YgK38=;
        b=d3ZkBCxvVwCglbeVBpa8xDlH4Mo9KMyhxZTQ6rI+clTxs9kVEBgy6VHXD+I99kEpYX
         1AR9cDKoUb5uMW9MHX1B93LHNoHBslOYqTP1R//+EGvvb0pWTzzh0aHPE5rmtJXcRrRt
         zETozfc/HDuI/FkTfphjxMk92Tg3Ojlq0BMXmvN9kGDZX5JeEehd8LHahcZe0juNrAqz
         bPlpKRSwOAUb4GllC++KPEwremBF6I3Hh/8t9GGu8yYQ7xjLEJvdmhaQ6fJUXPqqud6f
         syzW9VGGHJLU0jPHTM+5GDL86pGPEv5JEvPfTj+KBGh9WY1K7OTCqf692nwn0h6HTeKJ
         fCKg==
X-Forwarded-Encrypted: i=1; AL+hErHR5mmrT56BLi616rh2XwKISct7IEPzS2mX5/355mAgpt1Wg/y00hHDrW3v4NeC+gKnB2m+TvSdYQUbwh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1vfQ3q4JbiMFru7YN38yTmE+4ssoXTBvigwVUAtt+e/Q75fqH
	TQ7pGJDrb2LKZYPiff8mlHj9EQaztmMd/ypHojoKZELKIVKoWAaVWh+EWF+ynsdFOr874VkGAbZ
	D+qKrlLxSBKMX5wnmx6EQ+/L3ucQlPMo=
X-Gm-Gg: AYBFou1CLxKqf7uxizgI5KrvlSd+0qMJNjTqIJp0Y3LRMmrmTGjqZZKl8ITaUMY9/Pn
	DUTPBvgMv4u6yCq7+2PgIEhGb9oFmeVZPERe7pJGKxfEsY/Inv5MaJ5E7YSQBku3rr/8MvEdNO6
	OmJcuzNKt2jpyfoLIUIzb8iItqexmpP2vg5PYI3PnvptwuBqi//PEaUVOFaRj6BYc5LVmwopqBC
	sm959mfVfQUMGqZIYoVnGZPip2nKnqnwe8fOs1pIeXT6DOBmGvgAKPO1eQ/jGzEk1t7CO9BKAqQ
	772XZel3Ixg6vCgPLmnXcIn/NF6f3z4kfa+8VlAmnOAn0oikDx7+D5kmsnduzF9/kGz/MuoEDec
	kmWIoI4uMP6zkhYE2bcRjkt8A9SDOnN4HcjPnOm08eU2UNBkw/AoTAtDYMqlW35NjQPNVlaVbRV
	OlKZXcX78/TFrC1nRjWMB/6u9lIxY8axOSZx05CQE5BgXecVsAeS14zDXS/I64JrMytdIANYETC
	dlr90O9oMYthta1vU8nECNj2I+4/L0=
X-Received: by 2002:a05:6102:2c8d:b0:7cc:22f0:830a with SMTP id
 ada2fe7eead31-7d6ba3e5b4fmr2201358137.8.1795080937706; Thu, 19 Nov 2026
 01:35:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
 <87fqwyjwvk.fsf@bootlin.com> <CADvTj4rY=fN5=RYbhL_X56O5kbim-NZWRoRMQJAndZAxUZUo+w@mail.gmail.com>
 <87ld6pfc75.fsf@bootlin.com>
In-Reply-To: <87ld6pfc75.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 02:35:26 -0700
X-Gm-Features: Aa3M54rC2lbm9zvZQ_bRZwrXSK6-7XBYP8YuUPFJyW9y45aSx0Pn8h9Thei6ZvU
Message-ID: <CADvTj4ok=HXZiD4t1pgomZAD5_zRpe3uJyRgfBiPON6Rfx-wVA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
	"Artem B. Bityuckiy" <dedekind@infradead.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:38=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 18/11/2026 at 12:11:19 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > On Wed, Nov 18, 2026 at 2:45=E2=80=AFAM Miquel Raynal <miquel.raynal@bo=
otlin.com> wrote:
> >>
> >> On 03/11/2026 at 22:52:39 -07, James Hilliard <james.hilliard1@gmail.c=
om> wrote:
> >>
> >> > create_bbt() returns an error if reading a bad-block marker fails,
> >>
> >> This sentence does not mean anything.
> >>
> >> > but
> >> > check_create() ignores that result. It can assign version 1 to the
> >>
> >> That's also unclear.
> >
> > It's just stating where an unchecked return exists along with the
> > potential consequences of continuing without checking the return.
> > At least that was how I read it.
> >
> > Is this commit message phrasing/style weird or something?
>
> See just below one example:
>
> >> > incomplete RAM table and write it to the primary and mirror
> >>locations.
>
> "the primary and mirror locations" -> this is a detail, that's not what
> matters.
>
> >> > Unscanned factory-bad blocks then appear good in the persisted
> >> > tables.
> >>
> >> Here is a proposal which I believe makes more sense:
> >>
> >> mtd: rawnand: abort BBT creation on scan failure
> >>
> >> create_bbt() can fail on a non-ECC OOB read error, leaving the RAM BBT
> >> partially populated. It is preferable to bail out early rather than bu=
mp
> >> the table versions and write incomplete primary and mirror tables, whi=
ch
> >> would mark the unscanned factory-bad blocks as good.
> >
> > Personally I try to avoid terminology like "preferable" when
> > describing
>
> Yes, fine.
>
> > code behavior that's clearly wrong, as "preferable" to me at least weak=
ly
> > implies that the code issue being fixed could be more of a style issue
> > rather than a correctness issue.
> >
> > To me both commit messages seem to be equally understandable.
> >
> >>
> >> > Propagate the scan failure before changing table versions or writing
> >> > either copy. Keep explicit NAND_BBT_CREATE_EMPTY initialization unch=
anged.
> >> >
> >> > Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad blo=
ck scan")
> >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>
> >> I would prefer if you could write your own commit logs, giving us more
> >> confidence on the work that has been asked. You can use an LLM to
> >> improve/enhance it obviously.
> >
> > To be honest I've never been great at writing commit messages in
> > general and have gotten a lot more complaints about commit messages
> > missing important details prior to using LLM's. I can barely tell the
>
> For me the code is getting better but the commit logs are unclear. Some
> details which don't need (imo) to be written are there, and the big
> picture is often missing or not clearly stated before the details.
>
> Don't get me wrong, using an LLM to refine/reword/reorganize is fine,
> but letting the LLM write it entirely is not working well.

I guess the issue is that I often don't have the best understanding
of what the big picture that needs explanation in the commit messages
is some of the time, if I did then I would then just instruct the LLM to
make those edits whenever I review patches before sending them.

I think I just don't have good intuition when it comes to predicting what i=
s
important to explain in commit messages.

>
> Thanks,
> Miqu=C3=A8l
