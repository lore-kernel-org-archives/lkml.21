Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127516;
	b=gwNVJ2IJNtGWX1wTmSEhh6dRfYEFzYXVnRSypwONnOlefQeeF9WGejxiesvGtSt0Zv2w
	 Qp1dS/KOZ71THZWRr1RMhholx7veiJPx6lh7sOg63F1s/KL4w1GtRxdwzfm2zSqO3PJzR
	 IkNsZdKJBZnMUbnZ/ErOOngHGarh8vz9fgoupGrqMG5ZVgaLVInPNWdgcndlSSa/2rnIa
	 wqpn6paB8rzA5eflXhIm+qL/xNuO2UmIwWaBff/YxE/0LNp4rAx0+PyPRsXt9o0z6IJqS
	 Mpvbhfp3505jPODnHhBDNa8+181lwkKOe/sCl3iT0e40rLoenN5pp9s/O6AZmJ9ReiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127516;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=g47y6kBtYWl7nY19pO+71OmkiWZGVFw08qnF6J2lAxQ=;
	b=K2ibgvGMr5cnTCTgK5HfTL9/Ygy6teJcwYivFdeAabG1ti7GtczkMCyqyvehI/MmSeRY
	 jsKCkXUiyTEBNeX1cYwZjyI7OfkwMsnO/Ukh04zgXVogZ/S3rVwI/TFdWxLRd6rY2dyGy
	 r2STvC9ph3VrpFO0p4HxyS9zDijda3hU1WPECn3wAewIs+9DzuPZgSlLY9xvutwNuWgPu
	 klatQQs2Bjm86OqfNtfwIwIMkfUzZ7YDtnRPHZrAYcXxPw1fxUOE26YzdhG4UAgVAnRiC
	 HilW5yaI7QxULlrQpe6V7ck3aaGAFm0vPme8rpcKnAz8jT2lBp44fGIncu08kIKpu3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hmt6M7WI;
	arc=none smtp.remote-ip=95.215.58.82
Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ECB606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24ECB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hmt6M7WI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g47y6kBtYWl7nY19pO+71OmkiWZGVFw08qnF6J2lAxQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795127514; v=1; x=1795732314;
 b=hmt6M7WIG2umWH/vAuaPT+JIDyB2X/6djP+N4iKm0Ydvgz1wGPtwLtZaLe9abhtvYfR6AOhv
 k9t/pnZS3ezxi2x72TOYsaVfGQw+cnkIDSyap6UBVGB7kHBF5DKv+aS+aGJWAnnCxld3DTTRw6g
 eppj7jlMIQH1wvGZWrgflYc4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5af38cce51c07ae7;
	Thu, 19 Nov 2026 22:31:54 +0000
X-Mizu-Trace-ID: 5af38cce51c07ae7
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 23:31:48 +0100
From: Denis Benato <denis.benato@linux.dev>
To: Jiri Kosina <jikos@kernel.org>
Cc: Paolo Pisati <p.pisati@gmail.com>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>, Nathan Chancellor <nathan@kernel.org>
Message-ID: <767edb7d-8c04-4cf4-88fd-de26fe9b7f44@linux.dev>
In-Reply-To: <op1o5n3o-s3s4-1q2o-65pn-onss079rn780@xreary.bet>
References: <20261020092423.36380-1-p.pisati@gmail.com> <op1o5n3o-s3s4-1q2o-65pn-onss079rn780@xreary.bet>
Subject: Re: [PATCH v4 0/7] HID: asus: ASUS Zenbook Duo keyboard support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <767edb7d-8c04-4cf4-88fd-de26fe9b7f44@linux.dev>

19 nov 2026 22:31:57 Jiri Kosina <jikos@kernel.org>:

> On Tue, 20 Oct 2026, Paolo Pisati wrote:
>
>> Add support for the detachable USB/Bluetooth keyboard of the ASUS
>> Zenbook Duo line (UX8406MA, UX8406CA, UX8407AA): hotkeys, keyboard
>> backlight and the platform profile key, over both transports.
>>
>> This patchset is a collective effort, gathered here:
>>
>> =C2=A0 https://github.com/NeroReflex/asusctl/issues/25
>>
>> Tested on a UX8407AA against 7.3, docked and over Bluetooth: hotkeys,
>> keyboard backlight, Fn+F profile cycling, and the touchpad staying with
>> hid-multitouch.
>>
>> Since v1 the series has been reworked with the help of an LLM coding ass=
istant.
>> It was used to analyse the review comments and the code they point at, t=
o
>> draft the changes and commit messages that address them. I reviewed ever=
y change
>> and tested each version on my UX8407AA, docked and over Bluetooth.
>>
>> Changes in v4:
>> - Rebase onto hid.git#for-7.4/asus, now with Denis's "improve the
>> =C2=A0 driver support for laptops" series.
>> - Drop the delayed handshake re-send: Rebecca measured that the
>> =C2=A0 keyboard stays in hotkey mode without it.
>> - 1/7: check one quirk per branch and the transport in a nested if,
>> =C2=A0 initializing rsize_orig and offs so that clang still sees them se=
t;
>> =C2=A0 use u16 and declare new_rsize at the top of the block (Denis).
>> - 2/7: shorten the comment and put it next to the mapping (Denis).
>> - 3/7: shorten the comment (Denis).
>> - 4/7: only handle usage 0x9d on Zenbook Duo keyboards, and take the
>> =C2=A0 worker lock with guard() instead of a goto and a label (Denis). T=
he
>> =C2=A0 IS_REACHABLE() checks stay in C conditionals rather than #if, as
>> =C2=A0 coding-style.rst asks, so both branches keep being compile-checke=
d.
>> - 5/7: list the report sizes of other devices in the comment (Denis).
>> - 6/7: move the entries above the existing HID_GROUP_GENERIC ones, so
>> =C2=A0 that they do not conflict with the T302CHI dock entry in for-next=
.
>> - New 7/7: keep the input device names the keyboard reports instead of
>> =C2=A0 renaming them to "Asus Keyboard" (Denis).
>> - Add Denis's Reviewed-by to 3/7, 5/7 and 6/7.
>> - Drop the Assisted-by tags, following "docs: remove Assisted-by
>> =C2=A0 references" in linux-next.
>>
>> Changes in v3 and v2: see the v3 cover letter.
>>
>> v3: https://lore.kernel.org/r/20261013104033.36079-1-p.pisati@gmail.com
>> v2: https://lore.kernel.org/r/20261009153459.124752-1-p.pisati@gmail.com
>> v1: https://lore.kernel.org/r/20260513163248.16483-1-p.pisati@gmail.com
>
> Now in hid.git#for-7.5/asus, thanks.
>

Hi Jiri,

Thank you! Tomorrow I will rebase the ROG ally one to sit on top.

Best regards,
Denis

> --
> Jiri Kosina
> SUSE Labs

