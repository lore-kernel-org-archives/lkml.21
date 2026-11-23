Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442996;
	b=Vr439vyfUf3fGb8c5hCBfVk57wHfOboCOk5efdGzqlUt6yyeFYBmG6OKDWg6C5DtmFp5
	 LSrGXE3KN6hCu/wYel8DRhR1zIsce+DPAiAudxPFPiWoOmrvy21CY7NqTbEwSAh/KpuVU
	 UxHDx0lPYVrn6mnR1/7xLviBt1uhebepCbp6Plw6cLIKFBQJdHHdLTqph6gyADBW8F7Pk
	 KwLecm+CX0SLIBAXJ4GWgkhvaIXE/QSsCseH3b8+uc+diqGv4KN5AW1Z3RBsKAQY2ArvN
	 kTms3H7KDHerUwBeIXysWhJydo5mG/6wZtoEnVx+slWMBFZ0D3k4iS5IJihpjC0tNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OVzKGhTc2TdUCcheqmq2vHcetEiudrFJGz5SKyy8AVA=;
	b=Viwp52819dRFDlnmS/iTDUaUf97VcBurz6Mlr8WTTHgeeg/mhYg04V07/4s6/MHTfL0Q
	 pAr2hdFwVkgRSw0aIsx7KXTFqsfnGcgPJ9WH8HI62mL6cu/Ihmwx0CJGc1+BlGDB9tW/m
	 AKdu3rWvuNPvocyPHcfllrjRpADlGPpzgbbnfz8M0njGaXc1EneGMSvGuPz/s+kWuxHDG
	 QKhSU1VTDo9t9OMpKIxGvtp9GHm7fynGGECyR5kx8cBoIP1yvWve/nlUZLQqQzKE0OLy2
	 zGwdmR8q8/e323DGhaV8i1Dwfdrjg95NliUybgfXC6N3e3I7AVPXNps8v1cfErBpsjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WPrbHID9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62F606A68E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F62F606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WPrbHID9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1539856f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795442993; x=1796047793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OVzKGhTc2TdUCcheqmq2vHcetEiudrFJGz5SKyy8AVA=;
        b=WPrbHID9L2Bx69Hoj9aaag8m7Nn82Ch5w/okkhQ85oOKWMS3hLXfKYlXvBZRskWL7/
         U7I35pQM1A5QNmxFmHpVwIryX8R1bmVWKp+yLFY5NPtmrMPaYzdT5soQm8z324suGSJ3
         48d1vc42UH/vNH4/Brsn8zFh1QffNx34CesHcc45DCscRXcrLpte2gZJ/slN+yl98ZkX
         vqDhgnTHIMhveLClYOqXs3DhOKdqlwiec7Aj+5XWH0YUpD2wUZXbv28JRCAWe/xEfAO6
         Oka6AhPr3d+CkXs45tKkclN1vdnzI6YDOkKBVuS+4GkSfds0OpY/FdqvfVtslxkWwULv
         8opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442993; x=1796047793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVzKGhTc2TdUCcheqmq2vHcetEiudrFJGz5SKyy8AVA=;
        b=FeCbgIBCko6ogk2AihTJCY9u+YREpvBWb6VhGZ2cdlq83RdVVr58g5HEj0O4r+yOqf
         xl86Qf9AUsttReOzgYDtfxgjRVUsbppwWh1pdKwJZhSnr2FrSbd4Dqyin6nHEeydlHY3
         +z1v+vZrAqqbEMR8sgLG4r5Nl3To4ZrnCIXqWahJ+jIa4FO/31dLwlU+uaYrJTax3XUF
         FT5M68n+wJn2KP+PXT46voSdG22iWF4a4Z0hVEz07VYJwiU3t7onosU37MauqrExLf7y
         ZFo7peeqb9eXtXP4vcpycCtOnV3lgU3jY0Qa3mKyiOE5jJMmU+1toTt1okUrvuBQhKO4
         yaAQ==
X-Forwarded-Encrypted: i=1; AL+hErEKFtoATfFggK7PCmS8ynr7SJ5EHEbVtGEM9+S8xM/uDhFMyh+RiPzzTAvHEQ8zrcHVCq0BnSwY3nH4RDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hHZYbBqQlbE1xlTMddzJDgqngAi+/8FHVwO+AfavPu/UwqvMg
	u5ElMFLRzUdoP3GAuOT6YjfI8+7OxNw++BdzcnyNMsRBUlhG0fF4prbwn7SuVHO0B40=
X-Gm-Gg: AZFdTZdm4wNtjV8+4olTlk3/OLUfwWB5D/5A2oe5Ja4Hxiu/KN7VRsS+N/1LIdXGHGh
	V0RxOzedWxa3lCno3up9K6Ev333GTdX7h7tqG1WhXzKTO8PDeBRbDSdjXrJz0jOPiRkgawOYOm1
	WGw3h+8jbqfRJ4ufp/KgryeNyUoVafAoZD4f5nPIm6SbHs2bys6Hz5UQDJyzuVLdBUaJQrOHyED
	OOzZuFI5n55T9KRTGpRlvN5MM6SJnOgPOZOfK7Kr8OQhCxrhXLegWfttDd9LcV48rWjThTRzqhA
	7oGaauvn0Fj869OLQkQD7L1Xg9v7R5IG8FidZTwv6Om04j2fIzZQ6hHMvyMaR6JTkeiqAMXtuQ8
	6ayUQv5jw/iSHCyyu5+hy+58YUsqR8ID83CZB/DutbKIV3h0/VHws+3R7ODK+8Vh+JsFj9l4iXw
	RJt3S6/06YGzXEpKx1sdsYYr5eahENrUCpFTCJ5YQV+O/E2fRTVqGUVnzDHfEx1rI5h1N5vugXU
	9O46yOzC/wqbN0NPDAqMzcqoD0XO69k3/G8deRYj0MOQGHuSBYWq84RkqHB+j8WsVCZq91esHle
	Po1bZq2lh3WJkQ0XpIFEPcf2mAn5rCQ=
X-Received: by 2002:a05:6000:29d2:b0:4aa:831a:d0eb with SMTP id ffacd0b85a97d-4abb3c37a50mr15526213f8f.9.1795442993474;
        Mon, 23 Nov 2026 06:09:53 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm21645821f8f.40.2026.11.23.06.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:09:52 -0800 (PST)
Date: Mon, 23 Nov 2026 15:09:50 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] selftests/livepatch: build the test modules
 against the kernel in O=
Message-ID: <awRJLs-Ajbacirg_@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-4-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110161050.2451750-4-sashal@kernel.org>

On Tue 2026-11-10 11:10:49, Sasha Levin wrote:
> Documentation/dev-tools/kselftest.rst describes building the selftests
> for a kernel built in a separate output directory:
> 
>   make O=/tmp/kselftest TARGETS=livepatch kselftest
> 
> The livepatch test modules are not built against the kernel in
> /tmp/kselftest, but against the running kernel, using its devel files
> in /lib/modules/$(uname -r)/build. When those are not installed, the
> modules are silently left out. Only an explicit KDIR=/tmp/kselftest
> builds them for the kernel in /tmp/kselftest.
> 
> When KDIR is not set, use the output directory given with O= or
> KBUILD_OUTPUT if a kernel was built there, then the kernel source tree
> if the kernel was built in it, and only then the running kernel.
> 
> The selftests also pass their O= on to the module build, and the kernel
> Makefile takes it as the kernel build directory instead of KDIR. The
> top-level selftests Makefile passes O= even when it is empty, so on a
> Debian machine with the devel files of the running kernel installed,
> 
>   make -C tools/testing/selftests TARGETS=livepatch
> 
> uses the source part of the devel files as the build directory and
> fails:
> 
>   /usr/src/linux-headers-6.19.13+deb14-common/Makefile:798: /usr/src/linux-headers-6.19.13+deb14-common/include/config/auto.conf: No such file or directory
> 
> Do not pass O= and KBUILD_OUTPUT on to the module build, since KDIR
> already names the kernel build directory.
> 
> Fixes: c4bbe83d27c2 ("livepatch: Move tests from lib/livepatch to selftests/livepatch")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

The patch looks and seems to work reasonably well.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
