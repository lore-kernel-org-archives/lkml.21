Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795742079;
	b=eNnxlyOMAXRxTojGYQxrdNGWa3Gc52D8+YEDtPeDLeH/s+zs8fAAsUDtzcwAJvjXU20p
	 41ImTML5A5xyA7ay3h2guVwxV6zIYL7AuwtZiqHfHtE2f+KO0Vofkc6RUK8u9z47S3KP2
	 1dtTt4L8AlsdidvXonfLG8+SfAvzk/C+UedIoqP+1Lqt2PFJ8EFYY+7zctECEAQ3/lpUw
	 DCYMwIXzOShHd0xsFXMBPyODirR9JE68sqx+2KvduRadRgu1KvVZTc10SQo8SQLdfGTdb
	 vYZi+fEw5/iUL3no1N4W8lUn7Gr+9+4cUglqDnAnkEFAZ8A+3UyU74FoHDUDa4eijmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
	b=RMU971ZhuWtYPagIcw75Z0OtOo6gL3fJXyTMFSqbHH7j0kETe163TqQv91tq3w06sC1D
	 /ZNzSn58Y1E+uESckt4ezmYKTPQ6Ozx+A4sddir8Vh9FyxGxaHBxCvyqg+z6sodq02mqM
	 gD9bUY6QBKjjjXG7S7SsKK+G/atvjzUxDTmEURbu/IFt4Q/3SgU566N42Qf+kYdhQG4iR
	 ID4VX+6Bk+ClWwj+flrlZ0xNM1DT6TKOiWxr6x+nOYOTepzU6miLhpudczI6EF3bnqfnU
	 qgC8RjB+xXYboJ5OWzFWjcL2l0frf1wjz5/hWkj25CP34WiOpIR+4CGsrTv0JUWDO2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffNnuWKs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C603E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C603E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffNnuWKs
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so12420600c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795742078; cv=none;
        d=google.com; s=arc-20260327;
        b=EE7QgnSNG1RFNJLzLhe3fu8VYoTkBJJQuzWzsRxIT3wSAzF5hdlsXiFGUAtQuftM9f
         POpTDU1dp5+/nd9Jp64FMz3hw+C2PvPM+hxo2TcVyvAIkQV56iqCHS5NelebVI5Hq2kN
         ChV9/wClVzVekcK77PA+Zo36q6AWD7Kh/vRX7cpQP0AxIVvrsBY6gR3J9vLOUrws2NY1
         BOR+CKmaA6hHipN72q0aa/kqgV2A/T8b3Y6lqwtlxd2+7SVuteMRGloInwlVa0vGq1Vy
         mh1RQMpfPN81JVx45uXG40EXsapvaNk4iJTam8m6SAteJ3y+GhuQiH2ZyRcGuxQU3zpf
         RqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
        fh=vPpFL3C6EprI1FSkHbvg+AaQGqmuSlO29ZFkPvc70W8=;
        b=k5OvVX+5iqIyomdSz7dIJmHj0y/Fedc/tAqRxdP3d/HI5Et4S26RAcHdNFXvzuJe/D
         54Cu9Py0upbg27qi+Y14bjzzfpqHDbVio6ypkWtjm2WaXSXa9YaY3qieVXWFmvVW5Brf
         BSGK5MVj8SBdkGW8xwZ5nvUh2rX655ZBmlTonDk1HSEhq8eYWIZrsg8w0YXbkh1MpEda
         /Ap3495Cp+RvgVTd+rFN3KcKhXXasCx3yTgkZSEXNRxn2ozhfM7+IWKrllyLpeRKbG00
         P0KOzKAZyH/+yA08JZUQUn6Hw2llLSzVl2OfwKBevZQDaMKmpTU6ew11EH+VsU7NBNDO
         oQAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742078; x=1796346878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
        b=ffNnuWKsKYf3sXG4mlzfQOZDnQ75A/qYCr+clralhQcT6oOXBXG0tWjZStinG/DyYN
         bbuusKzV/KbqywIJB81kJXk9ODltskVMUuVVf7AY4vdkl0PoF2IfWcFv4XoXXbp/Nfde
         IV/QsMH2QZ76adKWUtTDal6dwRH5Le10IH7ZtAmmPYXHKkAnuNHgxuYXRFPOE16IuGN0
         bUprouJRbFA6+bTbtz6yXe81amUxWejn9wIi0Y3jkt65m2qI7HS0J7huABICF1Qwjl+C
         gctpVnDwBibg2moRpmhEDlELaBEpIBIhS7hjwSEFQkRj4ZLzCS5U+Ncy+kQHIpv5LBgE
         ATtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742078; x=1796346878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUBA6pVGVzuWRSoOa+DeUxU1u9Vo4hxpo45FKzvoAQQ=;
        b=utJrtLTPsn1Jr737fHjDCZGhy+9hIf7t2vf6sLqpZNVDzwxFUs+QieZ3PAzlox9o1N
         mbojDT2/opaKhcY5gSgVPfI/HH/gGfCd20uqT8qvoS1GbwUiXWQQaRYUpayEwQ9HQcvw
         hYziA3Es0j1p18QlI+DD/Ym5KWFE+6F+/bJmIOKjJxNKESzThz6nS+lSkgIDxxjOnEIP
         weifUzpbvJo4hsSpNuOXf06xX50YjAQv33AtntVSuP/NbMipLMHOrX2jjocuEVlYYW1Q
         m87YQ9ESuFzHcZqUzMcqncCCKwElMSH4o4JDGO2y9VbOZfplmHeGRWvcGbDin+glnHbH
         w3GQ==
X-Forwarded-Encrypted: i=1; AL+hErHKNrnTVWzjip215DBh2gYWPTvAYA6wYpnnrq6MTi/QyiLDd7wG+ye8v53YviJTVMVHm18G3sSaOZtpRCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aNI+z5oWGkVJ3opfNMRILTbXW+ZAhxAZuOqVunwcgm4a/6oCq
	4bgem3OcZVZ93WZJIVd0eAD4qSxgEO3W9y/Bl9Y6CKU4ihupXt1Q9HTq23BddjVVdHbifyZfTfo
	twzbgaUnOXk3QoWlzXokUVNMAiawZ8Uk=
X-Gm-Gg: AZFdTZd4a9RDz3Hs2Q60hndYBiCI0nSCD9KlWKMxo8CpxwNFylbdARio71QN0/FNV1h
	RXqH+j0v8wAwV7wSS/dbVzKit02KHHhf9nFwP+8y2x+E4qIib7wfIYtQqdWZLlxGZft8LALn8k4
	fjtYJ/q9kEZwfJPgrW0dcedcYu3Lf3UiyaYXC1lVHQKNQCex1+K76cFnhRwUdmiwlQYtTwhSuf+
	nbbcmQ29HO1cIXLrgSAOdSj+muAWfuGchHjADOPllurc45ebJ+IQp4ciLFDU8omvhn73olKpbpE
	q9niWrFHSPUP5xlspmfe8U+tqD9pi6uB4JyM+fyMDpS8GXn1anRnOMcOn4M5W1hIEY90qf06MTH
	u5HNFhpJQNinanyxghxKY+yrKbn+epV3ygbep
X-Received: by 2002:a05:701b:42c6:10b0:1b5:49da:b969 with SMTP id
 a92af1059eb24-1b5568fbf25mr23134158c88.36.1795742077731; Thu, 26 Nov 2026
 17:14:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com>
 <20261110-legion-lighting-rfc-v2-2-845726afb71c@gmail.com> <3e8f3452-06c1-8194-2d76-524418f0194c@linux.intel.com>
In-Reply-To: <3e8f3452-06c1-8194-2d76-524418f0194c@linux.intel.com>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Thu, 26 Nov 2026 22:14:26 -0300
X-Gm-Features: Aa3M54ooPyM-qjfnlrGm_Sa7EwjiM7vZt76XOBAjXwxqti8qG2MPIB7IOQa6o2o
Message-ID: <CAPKD0HcrVfvQyCTZ-1s26EO9wsLXxwJoeBRMro5jmt0BRjbAZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: lenovo-legion: Add keyboard backlight driver
 for Legion Gen 10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Wed, 11 Nov 2026, Ilpo J=C3=A4rvinen wrote:
> Thanks for the update, this one looks much cleaner already. :-)

Thanks! All of these are done in v3:
https://lore.kernel.org/r/20261127-legion-lighting-rfc-v3-0-15c55d9f15b7@gm=
ail.com

> > + if (ret <=3D (int)sizeof(*msg) || msg->report_id !=3D LEGION_REPORT_I=
D ||
>
> Just remove this cast.

Removed, also the one in raw_event.

> > + hid_warn(hdev, "unexpected answer to 0x%02x: %*ph\n", op,
> > + min(ret, 8), msg);
>
> Printing data like this looks more like debug level stuff.

It's hid_dbg() now, without the dump.

> > + WRITE_ONCE(kbd->led.brightness, level);
>
> Please add include for this.

That write is gone (brightness_get reads the hardware). The driver now
keeps the last known level for brightness_hw_changed with
READ_ONCE()/WRITE_ONCE(), so it includes <asm/rwonce.h>.

> > + * LED_BRIGHT_HW_CHANGED: Fn+Up/Down are reported to userspace.
> > + */
>
> This only documents what these flags are so why a driver needs such a
> comment?

Dropped.

> But could you solve this with devm_add_action_or_reset() (for hid
> teardown) and use devm for everything?

Yes: hid_hw_start()/hid_hw_open() with a devm action that closes and
stops, then devm_led_classdev_register(). The .remove callback stays,
empty with a comment, because without it hid-core calls hid_hw_stop()
itself before releasing the devm resources.

> > +MODULE_DESCRIPTION("Keyboard backlight of Lenovo Legion laptops (2025)=
");
>
> I don't think we should put year into this

Removed here and in the file header.

Thanks,
Ciro
