Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743118;
	b=JMFD3YO7DXfykP4zmOfRXRDC3I5UlMHfFfljgpoZNm2XI0+QbK0KTcRGhcrK//Cnk4Xa
	 pFhot27P1+i7C5CKgq49C8b16G7Z/evWV8/t+HHd09ZWO9n3PQ9WwulPMp8O99ECJNdlR
	 jtsSZI9JnmEEgg02GdLluCgysh0vTiViyf29ZtnurCinJ8EqyiK7a+ozcfZ2AtS4vYgle
	 6ja3h/ZJCYqu08fj59oAgQ09apoqfUsp86veg9eEo6/zTILliIhXFDAraNf6qVEB0zHq4
	 PVSPBMUcnlTKojQC3Y4Ln9y88QFvBytXLXUiJUIP0G3kGLWH7+7mkr+wp65IAAPfpCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743118;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dvkunYYib3t+WNUNoyZI1SS+DixzPh3PWhvxSEZOv1g=;
	b=O7+CCLdkI4ebJZpZI2cQ0z7xPMq1jz8/ywpGCvODROGiDSTS2vaf73gCfzVQve5ssSQR
	 FNa0vewHXwGCXjAskPBCOupMLGdREhRfTqwEacGs0z9In17oWB0VQNQDf71pFzRet4qnY
	 DCOLl/I2aHjQsW4Hf0c6RYuY/SIE0jc+PPdkZ0o0ihsKIQTC6XrM1Ox+5SweBObdB6o++
	 MiXknb5TnzenRXoM7Dm7tvg7p6Y/Yi/lytSbuHoc9whtALXtPsYN6x4iYh+uv8mqaK2M2
	 sf7J3cq/q+egU+vt6jTX4zAYNGWTidP9Ke8yJF4t89Z0Kl/R9GgRZNX4hGClFMF5d9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dQUcRFdA;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D3606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dQUcRFdA
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AED4740E0219;
	Fri, 27 Nov 2026 01:31:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PO4ih8q75Lpj; Fri, 27 Nov 2026 01:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795743110; bh=dvkunYYib3t+WNUNoyZI1SS+DixzPh3PWhvxSEZOv1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQUcRFdA+ywc6OvDAjEpFVEEYQKM4HkSgKgdqoTJmegpIAstDje+ulre8823jAq8+
	 3mgp8pes0/k5KZmURjF/oxQBIV/6SVQCTCDsxJjNq8UlLavALL3ARNRTiARbY3s3Cp
	 EBh/nVhoYnOUbxWzXxyt/qPIN8Lvgdcax23tr26/cY4fLG0CYpXk760RwKepUlo8th
	 cHJpST8atQb406XV917Mtl8IpY5XI5P9MsyK5R59g598t8pwG9CcDWr7gIAQwY/0zL
	 YzaQlaplB+5loTfkUbGO/taWYvooU+R802TMEhC1uzN5P1ChIsSI78Mgwjiqr5j5o+
	 PFtep5oZ9DXfq8xSOzEOsdHUtj+0Gk+Pl2LrX3uucLHJc8FhBLJdFRHvo2s8lHGC+w
	 S2MPeQiMboYHtm/9hCcTUaAxOqJMtN8HlLz3gfXj9u6JUUh94VB5Z2uLmIYPOPm2R5
	 AVZLg954fVy/P+pww/dlbNmn6oeoafSwAMW0FKdvDuq0Ky5wCbZeFUap4OSa0JFojw
	 PgK59rsu+1OvtAvQo6pD4jAFPyp+ehKpKd6rFy75RSt35UtoabT8e9egAcvdKFAnrz
	 nNwXCeyVoMAVuu3W784C2hGR5o2j4SCGU3iIDE+g6RUNrgPdX/AniRfk3rBrjemwDK
	 bMwpwxvhsXamV55yq2VWoJmI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EB40340E015B;
	Fri, 27 Nov 2026 01:31:41 +0000 (UTC)
Date: Thu, 26 Nov 2026 17:31:38 -0800
From: Borislav Petkov <bp@alien8.de>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: Re: [PATCH] x86/microcode/AMD: Warn when a patch is skipped because
 of the Entrysign cutoff
Message-ID: <20261127013138.GAawjdekyHPeTYi5_C@fat_crate.local>
References: <20261125175203.1003294-1-e.velu@criteo.com>
 <20261126004429.GCaweA7XoIaa5k_ZBh@fat_crate.local>
 <CAL2JzuyqD-2Ka-D4hhURtn892tDvHacz2C6V7a-wFMxQkEe_qg@mail.gmail.com>
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
Content-Disposition: inline
In-Reply-To: <CAL2JzuyqD-2Ka-D4hhURtn892tDvHacz2C6V7a-wFMxQkEe_qg@mail.gmail.com>

On Thu, Nov 26, 2026 at 11:00:59AM +0100, Erwan Velu wrote:
> We can adjust the wording, but it's important for the user to understand
> that the non microcode loading was done intentionally because of this trust
> issue, and the only way to avoid it is a BIOS update.

I know what you wanna do. What will end up happening is something else, I'm
afraid.

Because a single line in dmesg doesn't explain the situation but raises more
questions. Now guess who will answer those? It won't be you... :)

And good luck explaining some poor folks that there'll be no more BIOS for
them. "But but, my kernel just told me to update my BIOS. There is no more
BIOS updates for my board... :-("

So, pls send me dmesg from that machine you're poking at so that I can take
a look. Privately is fine too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
