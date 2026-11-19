Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058591;
	b=pSXzGACJn0TpUy7BUKk62Nnl9J1Tt6dRIETgpkGabtlhjRt3XPxXklwDMScSdUfc7bZZ
	 9yI01quGRLNYZVpukbFfKlJxYQssbQ2h8Mj8hN4o6DcbjEkL2RnGVFnhtD0ojB4LXWpDA
	 e1SiA+wMxDqTT8dm4wSy1/EhwhbrriI4c6Vk6LTHXGqT5f2fSbxGCX4RpGfPHm4agqoiZ
	 wN3reysPlogwfzzlVyu3o51AvD/bIXM3rRAKg6Od8kWeqZAkPZBSpTL9PNy0+pv2hrftM
	 8+AdAnc1wXGkXP82ftqH5DlIMx4rywML3mdfm0G0zTXPQkiJ9WX7aqwiK4eXffpD8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058591;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=1gCemJ+OoIUXvLmdwnpvyyQkDg9ytHfxR6YyKzs9Mfc=;
	b=nuwHRzXe0Kr/L43DCh8AFpljYeG1GDncdlJ0GXCfh9A+s28AN5W0JxjYmBX7ipoEFCvR
	 3IYNqod1idi727X/iKSlFNinb0lqNSGeGx1ooBgbl9Jm5jcEdlD5iYK0EMJhMOGgNQOxH
	 4GM7FlGRvbJqC1RBjB/6IbwDYPINqdZGeD3pOMGGi1zGQ7CZ0ibXBuoWckyrHmpjCY/iL
	 olwwG+NtR9zDoIiVy1AvFBioXdyKscZLg+XdpAXCuUqqyU0XvkDQP7Vdx3RyCv+5HFCVC
	 iAOROj8B7u6a4N6iw9a07BaBXVl1wT3bh5obmUhu4PkZx8/IEwtuTCn+55KKN7tq7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=mw0T9X9D;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C9A606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C9A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=mw0T9X9D
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EAB833F5D1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795058588;
	bh=1gCemJ+OoIUXvLmdwnpvyyQkDg9ytHfxR6YyKzs9Mfc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To;
	b=mw0T9X9D2Q8CU+WtyJVZNE/Zwm7KrPBiUtl8ZDpAF9yxZIBJ9emJjnlRN7uNjK/VV
	 ML5dE4trEvhFcbM2rSfAiXCCP8+CmB5/zUio8uuclhm1UMSXJq8jSywePX2wc58djN
	 NCetCeWZuuLs0KU96oofL0uYnRk5rtEmLM2uFMFwv81/qnblsLjh/FTuJdroTbfCFo
	 hupZ2u0vMZjPCJA3Fqhm7hNhdfej3F3sh0TY3lasZ42f5pp754HEHL0wGt2GtlZwN4
	 HYULSEpE3TXOu/t+VEpdGIJL5OArpipE0Sv17G0B6Us2KuOLMUAL6azgsXkmtV9w+q
	 nIOTm0AHgEXQ2ABwBM4NUs4Sr8JzViIsZcA4i4G+DnK/kIvwEDDUO4rdhdX3zKaL8k
	 Hy8XON38b2TkaxWWWkqQXnE0j/NR2Q6LQzbcp8gyPgil4ua5+ToVjTd1s0e8shqxEn
	 j/CFVmDo+qjoJHnMIW1gyunYvd3Uxhe4xqKOAPCKJ0J4IBVX6y2ehSFCe6AHP1NJMP
	 ccrRgGRFBMsuRejzVvSlWQKdnfbVJA/Dyj5trLa/ieoB+I6TJJ365sDTWWRVq0faAr
	 XsAwGM9mC8APQKxHjoeAKIrSUgHtQAQy9Cab1JMv5ieneUP01ESDNVgtT3UT2YEM34
	 ZnK9MOQ2Ku2QI9NQOakJSOvI=
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920fb8b9859so43324546d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058588; x=1795663388;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gCemJ+OoIUXvLmdwnpvyyQkDg9ytHfxR6YyKzs9Mfc=;
        b=CTZoa2iFbOgdGLUkKwiorfDqzVfVW05V26+fcdXaAbke0Z3NBqhfsNq+J4prL2GXxM
         z3U+LpdRMlvI4h4BHZjPhClzZpYcBlj72AxblNRqyBTg23CcqTm6jvDik7rz/YDH94nO
         g3R/NBDsHH9m4gbIr2Iol+Zzni6Q7PcEmZ7m/Q3aC7VQM2QsjeNht57w6xSSriARLL9t
         QMBdj0mLeV/YRh7KnAoYHKEsUBOcReqNAnxsKntwb0XWCOFYOh/zHqiJsrHpVIICCEqd
         MAgDTZaE+GsZ+fWu0178K+ndNovIojFqJOcQnCLs0eQZGtkzTD3beix32SbuGRd1152g
         cl+g==
X-Forwarded-Encrypted: i=1; AL+hErHf+1uaV6gEnjmgdiFWiQVLAyUrMBRg16BDMOlOJPh7mN4K592rMUvjGVtHKthi6CJS+klwEZf4680dRhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gmAJ0OpI9Dpcv0hf4MmCVOKZ2n5G6AMoOFfkc0Oz/1uzND7hE
	6uBFpEjBS+dnol0KCcgvSK3ho8dYdaJ65BUBq5uNKWiKqO0JnPZ2Ys8l/Z1NeudcURjloDGvfaf
	oUnICqmV/2rp1ni+Yt37ucvtGBJ9mcHvH7ys7SJlCt6PsccOqQbG45HtDZAsCDLEdESjZgqIUJi
	yv7aHqpg==
X-Gm-Gg: AZFdTZflwSWEBSTi17/sFGMdGLF2GKLzHePEodUclc6cR+oxTkRNNyY9pbijjJ5885N
	eaDBjxiWJRFyhhvGNJfI62wJZvp8xY3gs3q07TtHL3k3CNRoRgvsEGaC0ET2fEusuBm3lT6+SXB
	DD355DHYHIy1VF/IGVB3R/ZII1yMO4ItABCgVl2NQI8VYGVA2kWL31rScbxZbAakmzO2OrsEZs2
	rxU0AXHeuliq1x8GznxkfU485C+/aXsbHxhEuWEyfFIZGZbQYdhG2foCfUF4kTk3eQTdyF5X7Aw
	FFpfaj50gmb1xzglMqp9VcTTdGVoKKvB7wXJymflmHKJbLfmNoVEZdi5gCVk6KUG14s+KYh/toi
	R8p+tSwL6lkFyUyL22e04hsjjAgKyJMYlCdsKDTxK4Kfa1jOxjU1ATYuHd2jugw==
X-Received: by 2002:a05:6214:4886:b0:921:2b3f:95e5 with SMTP id 6a1803df08f44-9212b3f9742mr4788816d6.24.1795058587614;
        Wed, 18 Nov 2026 19:23:07 -0800 (PST)
X-Received: by 2002:a05:6214:4886:b0:921:2b3f:95e5 with SMTP id 6a1803df08f44-9212b3f9742mr4788556d6.24.1795058587036;
        Wed, 18 Nov 2026 19:23:07 -0800 (PST)
Received: from localhost ([107.159.93.232])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm38265326d6.16.2026.11.18.19.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 19:23:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 22:23:03 -0500
Message-Id: <DMYV5T0TLKEG.1RHCZH8L40LWY@canonical.com>
Cc: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
 <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
 <lkft-triage@lists.linaro.org>, <pavel@nabladev.com>,
 <jonathanh@nvidia.com>, <f.fainelli@gmail.com>,
 <sudipm.mukherjee@gmail.com>, <rwarsow@gmx.de>, <conor@kernel.org>,
 <hargar@microsoft.com>, <broonie@kernel.org>, <achill@achill.org>,
 <sr@sladewatkins.com>, "Miguel Ojeda" <ojeda@kernel.org>, "RUST"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 7.3 0000/2651] 7.3.6-rc1 review
From: "Alice C. Munduruca" <alice.munduruca@canonical.com>
To: "Gary Guo" <gary@garyguo.net>, "Thorsten Leemhuis"
 <linux@leemhuis.info>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261118150247.972732815@linuxfoundation.org>
 <cb9ff126-7767-4c60-b735-1b7890a247fc@leemhuis.info>
 <DMYMKQ2PRN7X.WKDSQ4X8JIFB@garyguo.net>
In-Reply-To: <DMYMKQ2PRN7X.WKDSQ4X8JIFB@garyguo.net>

On Wed Nov 18, 2026 at 3:39 PM EST, Gary Guo wrote:
> On Wed Nov 18, 2026 at 7:02 PM GMT, Thorsten Leemhuis wrote:
>> On 11/18/26 15:20, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 7.3.6 release.
>>> There are 2651 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>=20
>>> Responses should be made by Fri, 20 Nov 2026 14:55:47 +0000.
>>> Anything received after that time might be too late.
>>>=20
>>> The whole patch series can be found in one patch at:
>>> 	https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-7.3.6=
-rc1.gz
>>> [...]
>>
>> This failed to build for me due to a problem with rust during the "make
>> bzimage" stage:
>>
>> """> error[E0432]: unresolved import `crate::util`
>>>   --> rust/pin-init/internal/src/init.rs:17:5
>>>    |
>>> 17 |     util::*,
>>>    |     ^^^^ could not find `util` in the crate root
>>>=20
>>> error[E0599]: no method named `extract_cfg_attrs` found for struct `Vec=
<Attribute>` in the current scope
>>>    --> rust/pin-init/internal/src/init.rs:171:39
>>>     |
>>> 171 |                 let cfg =3D field.attrs.extract_cfg_attrs();
>>>     |                                       ^^^^^^^^^^^^^^^^^
>>>     |
>>> help: there is a method `extract_if` with a similar name, but with diff=
erent arguments
>>>    --> library/alloc/src/vec/mod.rs:4245:4
>>>=20
>>> error[E0599]: no method named `as_ident` found for reference `&Member` =
in the current scope
>>>    --> rust/pin-init/internal/src/init.rs:413:28
>>>     |
>>> 413 |         let ident =3D member.as_ident();
>>>     |                            ^^^^^^^^ method not found in `&Member`
>>>=20
>>> error: aborting due to 3 previous errors
>>>=20
>>> Some errors have detailed explanations: E0432, E0599.
>>> For more information about an error, try `rustc --explain E0432`.
>>> make[2]: *** [rust/Makefile:649: rust/libpin_init_internal.so] Error 1
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [/builddir/build/BUILD/kernel-7.3.6-build/kernel-7.3.6-rc1=
/linux-7.3.6-0.rc1.400.vanilla.fc45.x86_64/Makefile:1440: prepare] Error 2
>
> It looks like there's missing dependency not picked for pin-init changes.
>
> Greg, can you drop
>
>     [PATCH 7.3 0580/2651] rust: pin-init: internal: init: emit `slot` usi=
ng mixed site hygiene
>     [PATCH 7.3 0579/2651] rust: pin-init: internal: init: support tuple s=
truct constructor syntax
>     [PATCH 7.3 0578/2651] rust: pin-init: internal: init: support tuple s=
tructs in `[pin_]init!`
>
> ? While patch 0580 is a fix, pin-init is not used in a way that manifeste=
d the
> issue in 7.3, so it's simpler to just drop it and the other two picked as=
 dep of
> it.
>
> Best,
> Gary
>

Hey all,

After dropping the above patches there remain a few compilation errors with=
 LLVM=3D1. They all seem to
relate to pointers in bindings being sent across threads. I am unable to di=
agnose the issue farther
than this, as I'm just starting to dabble in rust/ so hopefully someone mor=
e experienced can track
down the patch at issue.

I've uploaded the build log alongside the config used in the pastebin links=
 below.

>>> make: *** [Makefile:256: __sub-make] Error 2
>> """
>> Full log:
>> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/fedor=
a-rc/fedora-45-x86_64/11350094-stablerc-fedorarc-releases/builder-live.log.=
gz
>>
>> Have to run, so not time to look at where this is coming from right now,
>> sorry.
>>
>> Ciao, Thorsten

Link: https://pastebin.com/WCpUdkaC
Link: https://pastebin.com/5BUM2Cys

Sorry and best of luck,
 - Alice C. Munduruca
