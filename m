Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.202
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943780;
	b=l9rw3HnfAA/NkmNPZhtMfclnKn8FyZiWJ5wRQxl/CremHm3OV3VYIA81YPFpiwCpcKyd
	 uXfZctG/uR1qxP/5EuHWE5FWw/WCVhFWYqEzcbM7pAdxNwEKJwl95FAja+bHbiWGmZhkx
	 RzDADo79q916IjkOYtbcuqShMgkk2W3b3PfB1/TcdwIyYPcQW1NL3yKLktpIO4Lu8u1lQ
	 3t3U8FANxtejh39W7ejgZ86pjGCKTiHs33kveGaKnw7k+xGRoEYAwgq5xIDl0xXmPG+ME
	 sSw1cIIvBihuKKgEwk4Nq78LOweFhoZtREviQFmnTUAthtE+jlYcbigpgVWJqKiThBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
	b=GD+lEulGoPcn/n92XxjuGm9Lh4bsCarM+KoBgjZ9kdju358YsKjKOo4Kch0Tzvj97bKc
	 uaXIV4ot+3eoHTBQPcw98tndRj9OPo9tf0/uO+rs0BLljv/PVgyYKn1payF9Qoclw8bjH
	 zqcJPRP1WWBaDij21mytUlLiGPKYPGfyqKEXbXCvhqIp+b9uMTlx+VSdiJDi0OIpAjMeI
	 ayIXBEap+KntY6p/r9XBI5z9GIPmzTtvqHWlGlXSEtD9VMCngN/lL51/JNfkTNtje6wi3
	 1jCLu7C4XH0oZBOvQV2/Tjas5DM+V1dMdauOqCYr+QS4u+X/lZ3QgSjBAR9ZAcO0U9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONtZm+tz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.202
Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A68606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A68606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONtZm+tz
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4b94bb43008so10412b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:29:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794943779; cv=none;
        d=google.com; s=arc-20260327;
        b=j1q1CenCQarZcjWcif2I2FAvtC+c3MY8TEkAMzG0MwIywPe2aKP0jrVlf77F+kD6xu
         cGPgqo87fUtWpr5u0CkipYYkGc1NzATGdHOXSA9GgT5HBejeJlZLpMuZIHX5uJ1sstfb
         Zip1sj10SqJyJOxLam05azp4ZkIO20+DiifKc1swArqefVO1DeLkSMrJpnHERu1q4HT/
         x2hTNSC8JbaglKAkQ4GAkTgpzh2Um2WK0zc52JySS/WYNYy9U+3XEAu4iTmlCx+Q9qn5
         GKd5Fq2w5+tAdHuzgDzQUjkvOmvQ08U/2O0/slgZX1KyFvVhpD5AcsJg8iN3KBIdyft9
         +9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        fh=SUUOYa911/doAgAMK6si+d2NTsOUZQHNQwTOFCs3Es0=;
        b=jlVMMYzeaIyZZkYzqlVPrOknIJx6NTLvd9cm3rDwjDhTweDPcVxoJkSRhHvQVYVYC/
         BuNZm1B7vdS2y9dBJLKEvHbMWlnTmyop7V89AS/4pYC2oG6dtmpdPY1C7VdyrVPey+G1
         VK7uFbhalBqYDtfRMpvGB7rz2Q1Fx6OyDHvtXoij0nwo5DYrxVzZDs7mrbjpfPHYg7hs
         dqBi7CVNAthsqZL9M/tyx4BcBZ80zDeWeVeVK8kziEFZqsbKI0NYLiXcVjNDijEEQPsc
         EQVtzaB39R1kGUiQFCMISJKbzrwHOROyB+Xjb2zoL31g/tbQGkbecFzJhG5I2Mb9CnrY
         2ngg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943779; x=1795548579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        b=ONtZm+tzCe5AxgdvotSdykWIJIAbYxI4gQv15Oeapf/2EcbAP/6T4HAWMl/aXQBdME
         FQoa4ZNSpSvqeR+RNwT3ryKYV496fons6L9R1ulG4QUdcnhD1Mlw23erslQCQ2n4z33p
         K1zoPDeV+4U6j9uFL18VX0ctUmKEHTjvw0F/U6WV8PknxTFdTM4umaWazDh/AV7XoomD
         lyENT5w1U7E8aHFFAl7DO70nIJkjj+nipnAfpLWijihnmeb6XvlxnJ8a+bzeTeosQFrW
         +pofxMPwuuYwFhCTq/xIG5tojiOTIUXacTg3yL4pmjqaJQ7EL35D+Wn61rYnFW/mDgkO
         Nwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943779; x=1795548579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGjBYsfF8c+MCFmt2RtqM8D82MXv6pCt/UIwi1wWB78=;
        b=ZJT6wIxZGIjgCv/JiVFzA1CIo50+Vb64ZLQWZshCaVgt4E15CKbJhoCb5DAV8p56Lr
         DFFuTHXJGxCYq2aR+wlCPUse8d15hUf7+4o3n8wig6XnSBtg90S4HQVo/Zf/Kc3GvJjx
         Y9XxuAPKk6+EAk9aCD1gBhm4PdTpl7M3/qL2CMCnxS5Ulh5og16HHJ7QzZ6yQcV4bpEg
         jDFZkRHIUdTW7OCIhxXtbITQeRXuhLdv8t4XiLbkT8XBwvQYc/+MlW6GVuPaDciGUdJO
         j4eklGCna2KhwBGFwQo5EunjKwmi1LrNrQqvnn6zNIlxV2wlRHC60lEh1lekmJFOx5e0
         ixqA==
X-Forwarded-Encrypted: i=1; AL+hErG/RnALV7gzSlGgSwYhoXW2iMxUXYtGXp35m/KvoDHBkT/Bm52/r80Dn8Hv6RZOx+NavwTzCEw++nN3shY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/82kWZXMLYVxgDZZT0gCHZJSTh6tlN2HoblCXp4km80edopHx2
	/3b5GIn7/kPCYWcspfzTbUKL2I/5kO9/8AQlJgYKLDgsQWdoZCCd6RfWBwUQiv5baMH58HQh3gi
	+PvIvbpoc1pTT9pTZ/gaCWWdZBVLYC40=
X-Gm-Gg: AYBFou07XzmY8ggXfGyqiS/QaDnDrNv3WcXBB8VSB/EzzGZuuCJqi3LlH2SMTYbc1qh
	BGBZWXJUWczZGAS0HeSAtS1mrgB9PSyAkeXgMYkZmMPDXSzbThkmo7RoqzRjFkQH1B6+5gUgvcX
	WOTyRePqDDHmdY5xW5DqmOxmRBOzozjb1bJWePVWdugdXYKwFU7z8JzGQtTaoNyB+BPYxLvhxs2
	7izv7l79EHYjj4i9QSE0q8ufAsVIVvjQ1FGz86nVgnu6xwqxr9hInXCGKzH6fe7TWzpa0VGWApb
	/7ELT8lpSOxMyX5qCjrlcPZWVQce7KTkL8tThEvHjxkoiFcJtnejlb4oR2QS8MCkNPRvNl2+lWk
	cw3EEKGeCIoG+nMrbjAEdzggujTndxkKIkaKycEX5SNLQ3gQjuFi15o6B1hwxc7h3xmmrFPLbLM
	19IIXlAGgD3041y8i1vwJ3stjV2mKYrtkNB6sV9hhCEjgOlE9+ZHl8
X-Received: by 2002:a05:6808:30a9:b0:53a:e153:e8e7 with SMTP id
 5614622812f47-57741d17630mr920531b6e.44.1794943777052; Tue, 17 Nov 2026
 11:29:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
 <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
 <6ab4a114-57b2-40c7-99d4-55a4ac4c9a9c@leemhuis.info> <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
In-Reply-To: <CAJ6F8CHzm4=ryY+j3ao6doR=-67Lq=3-w-kbhk1wdvtYDhyNeA@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 17 Nov 2026 11:29:25 -0800
X-Gm-Features: AclHuK-EvuFT3sTbDUuzVCeVohToLo20JL-jPaY9zCV6KfEdKeWy3NzN4uK5qVs
Message-ID: <CAGEkeHdxaC2BBg5wWOCL0pj0r4Ks6mD_a3KpE7h+en9Aupb4zA@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, almaz.alexandrovich@paragon-software.com, 
	ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:43 AM Cl=C3=A9ment Smagghe <cle.smagghe@gmail.com=
> wrote:
>
> I'm happy to test patches.

Hi Cl=C3=A9ment,

I sent a fix that makes 'ads' opt-in again:
https://lore.kernel.org/all/20261115103845.56074-1-dennylin0707@gmail.com/

Could you reply with your Tested-by if it works for you?

Thanks,
Hungyu
