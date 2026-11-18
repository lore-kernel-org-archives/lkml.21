Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030687;
	b=XPzRLIzO0Rvrs3+M6IRqP1579+ymuLwcfaoVb0augCQFTArPmvVEYb5Bg6fzIUj9f+G/
	 7m59eXmyp3j6cG6CFf/0/w+mwchO6js6YnIWDqI254WHhCbrXvDpvaCZdf0nHef4ePfo8
	 2FHbNMeLmNrgfL+55NDtTmJQE6yCztIdC8o+Qll9qiSxztvriJX4sV963awNbKgJr7hUQ
	 k3bet06Ibdn/FD3K5sA1NFFU+/8kNx0oMEJ+4N8uWHjqOFykrAHBZUPUGZIZA9+SBj3Ps
	 YiFazlOqeVaWDC860InDIfDlKMSHaR/y76KUPvlgh2CLK+DoVFXivP9E4Nekc9JafQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=c66EFlOJVYnnxUqxIZvQrJ/FVmfJ5lBMhar3bfkOCRs=;
	b=LmDDr5r1d+mYhxVXSZKPl/w2Su8IDehbOvsMg6c9b/lADNwt3sVCLgWK7HwB0QRuGxVc
	 ozPVK6nPRwP0Hnlly/a3a4gbrQby7QTeZ0yCFCzqQ641Geg0Lzm6BZB/kIrRoNg1zbI8N
	 FsqgKF8bT69q5PQtLbZIuLasPKhpTk28u+R6T0srX8xKQGLQvngf/TNGwws0ORwl3dcDG
	 PeIhcMi7NOWUPagzDWjRg/MDmYvvtsJvXnvHCcjEVZ+ztTI60E7k+BQTmLjuJH+dR6p+6
	 ZYd7YiArlO7ERDQOFYGtzy8NDvb9kSxtrRx4Dlw80hGfUoAST+r4u5bxgTTJJaM6qgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnMdscv8;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E11606A7D6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E11606A7D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EnMdscv8
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1284807c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030686; x=1795635486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c66EFlOJVYnnxUqxIZvQrJ/FVmfJ5lBMhar3bfkOCRs=;
        b=EnMdscv8hwvfSOcoWdXoAholEjGvjRFy+uqBYbzeehG+zgiSKLV5jQBVF21THsEkbk
         JvBDKg3vb/cWyyVEBxuPq6NIgy4dU3fXi3Veqd4xNFeqFVpxxn0WrD2KdfkiHUX/l4gH
         8oEosYa8vmivrJsdKZva8DwajohPFW85WzgopMfivnR+xfdVz4rNsR1iv8Y+Pjfj0SBw
         zOk1fauefMci0WlQhzmxvxT5NgfPbdGAS+bYBAR66oH4rsmVaYci1wiPR0xRakLUj+x6
         u000t3LXlWBvXtAo5lbrK39CqhpOL5Ihy8d0CyCW9OmzfYjidAZwi5YkA1WeUHuUU+/Q
         QQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030686; x=1795635486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c66EFlOJVYnnxUqxIZvQrJ/FVmfJ5lBMhar3bfkOCRs=;
        b=0t8g/krBIcpSp1Dya46VSXKM8k8Zih7HMqelKofXoWcfjMOVIHvlab0dgjazUZ47qY
         8mK7dYLjsgNHRAMwUDOKPDd/OqjGgnYYhfOA4WVwunMAutIZZk0RGGp4MUFz88AEraCQ
         hVAgoiuS0X7Q16yWGucAOJstpWSwInDb04/VMUWc2EE496efcCW4qNgn7djPKJ4PW90l
         BsUJUaafBTrAAVDOOj9l993xxFs88Rl8tpQJaD9G4+Kg0lsGMysU1vId72KGWn8iYK3x
         5Gtdo7HEiWVUq7pXA5U9aoeF+OeGw9GDHupwfoHx3vLc+p/JaHIvjEoHYXQzSlRkhbsR
         LYww==
X-Forwarded-Encrypted: i=1; AL+hErFbSvpLxUVo4yeIhEKjV2hsVanp2LgbEnnKlcdOHYCL8SWYEq/i+rg6wDBZQOuG0ciaCFeJPJq4737F+VE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3jMjGs74LdN2aOtwWqWqmaK+OqaySm6QXLEtQWamXtY+iV7i4
	mTzqeiZn3ZLwuZhcrGMA48rhsU7NHQHNwX4OqwF73bUC3WfWkaQcDh7L
X-Gm-Gg: AYBFou092Z+7dV5c70JPpnoPR3U008teUHdUOnxXyVMwT8c0lGLBpcIQQ3wTH4zU+Rk
	Vf4yncBdOo0M56s/qIezmGV4HwEOCbN1kHoLjvWLsCfklkpTR4yhcLscIO3oeFC250meK7ts+9a
	1GYPSJ/MBvtJyqYY0HeSsXyBqNwPzKJCpU/lv+xa8KUQVAsHrYjIM63DdsKEWpRE2KcVE7bneuz
	CmNgenkRf6bkC7bki+8LeHTkoTIXGL3zu+1pQHWRbNoFGxafevaXX+dVWPdUn6dp75FhXgv7Sym
	9P/YRanEG7/C851YtDtWKdrNNW1D1+YerYTlgq63ONRNA5Y2KewnNOGb07D8kEsdNqwxtGfMIEi
	KiCKOXkH0dpPPhHZSHiHw3vnUhLVNT8CnFIyjbLBmLcPj51cwHCF3oK+1LrCW/5oVbvRwluPD/A
	5Qtb0oWiuA5FTSOuW7V7ErXTiWnwm9X2DbK6cgRRxDq7LPbnanyuPtlZ8A0bDeuj8CZxwJFqnjL
	fIQ2/MF1NHCk2QCnwYs+jWadMq5yJ2BuXY+WK+clntZXo07s2I/Q+TGyx0u3LRqGdYKB2U/xkuP
	+UcrrA6VUghg0R07z0D91clVfSFnm7PsPu7iQdbkoWQ95306LcNAVKiZ
X-Received: by 2002:a05:7022:7f15:b0:1b2:3448:840f with SMTP id a92af1059eb24-1b543cb4093mr3136249c88.7.1795030686140;
        Wed, 18 Nov 2026 11:38:06 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm8261719c88.4.2026.11.18.11.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:38:05 -0800 (PST)
Message-ID: <9bf135b3-455f-4463-bf6a-b80faa2e4606@gmail.com>
Date: Wed, 18 Nov 2026 11:38:03 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 0000/3318] 6.6.163-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118150313.527275416@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118150313.527275416@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:10, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.163 release.
> There are 3318 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:42 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.163-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

Same perf build failure as with 5.15 and 6.1:

/local/users/fainelli/buildroot/output/arm/host/bin/arm-linux-ld: 
warning: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/arch/perf-in.o: 
requires executable stack (because the .note.GNU-stack section is 
executable)
   LINK 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test_truncated_branch_stack':
sample-parsing.c:(.text+0xaa774): undefined reference to 
`__evsel__parse_sample'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
sample-parsing.c:(.text+0xaa784): undefined reference to `perf_sample__exit'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
sample-parsing.c:(.text+0xaa78c): undefined reference to `evsel__put'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test_truncated_swapped_raw':
sample-parsing.c:(.text+0xaa93c): undefined reference to 
`__evsel__parse_sample'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
sample-parsing.c:(.text+0xaa94c): undefined reference to `perf_sample__exit'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
sample-parsing.c:(.text+0xaa954): undefined reference to `evsel__put'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test__kallsyms_fixup_end':
symbols.c:(.text+0xc189c): undefined reference to `dso__symbols'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
symbols.c:(.text+0xc18b4): undefined reference to `dso__symbols'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile.perf:697: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf] 
Error 1
make[3]: *** [Makefile.perf:267: sub-make] Error 2
make[2]: *** [Makefile:70: all] Error 2
make[1]: *** [package/pkg-generic.mk:286: 
/local/users/fainelli/buildroot/output/arm/build/linux-tools/.stamp_built] 
Error 2
make: *** [Makefile:29: _all] Error 2

-- 
Florian
