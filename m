Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029398;
	b=LED3seH1KsBPtkVAeN9nD9f2yJ6QsBejj8YIRCIGKY0pPkzZNg6qYGrIa5aLVFToACzn
	 1XXSc+OzSvil9fh82kgp3azM+m69kUUt9Y7h2dGuk2Jp1wZoTofmDeVh+dShG5r0T91+b
	 aH/ybf8tYRc1QVQGSqBivYyB5BBiFAfw1yZKjmwIO7iRpMZxMJ/FtsvBrq9PFQZ9n1zmy
	 qQNhiSvwhQxCaumbsIiq6Y2SAWpPNurKBNhernDF00Is+mtFcQwDOXZl3kYG0Mb7YA2nu
	 z6UOM0G8QGNA6z0m8AgDtG9yW/otMc92DBkNmfdsgVf18fENax+5NRho2ZJUwz7yyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=58b5SUFBCY4/MY2JUfmGH8gHdBS79YyzhPLRjlW4m0U=;
	b=PeA90lIjmNrgmLhUUyc68cdubdQt9ajJPmfaguEkCMdnIYtT9uPdbHhowQONEddPe1DA
	 DcwR9KJQ6B4hG1+Gn8dhlGzA5kt8xtI9cPxXGI6xXeN5ZnqQzmIwuExJgPnMZpbVxipWD
	 D5itbnOmDFN5Dd7Eh2z3mox91zEZWWWTkAltu8+tj5K9g/YyC5QPrlDDwTTst1KfnP6Pc
	 TnAhLyuhoLEe/6X5EWgkNtqxuLL7F0uAiJKUPv9VSbhrpCrW11KxWvabrMgtkLAZMDgJd
	 Zt1QgcXSQXQ1P5bks0Ll74vToBHd51b2zlKYw9Mo14e8/OWUz31LcN3PK6XKbeZyR0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJYexqmp;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD670606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD670606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJYexqmp
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b904d10882so613738b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029397; x=1795634197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58b5SUFBCY4/MY2JUfmGH8gHdBS79YyzhPLRjlW4m0U=;
        b=tJYexqmpB1JqjQGtscML6/STrXZSc3Zf/53lM6/iVI+Lp3aqnTaQk1NbjW5KKOb4BC
         wdT4sl8305PhWVaBETctmMi6n9bHgdThPbx4CCPY6sdren85WFDhcebDlSmNOKdg8lgz
         qP5JT14iXk7D5/MguF9AIPPm6bN0OkZNFh3GMOYkffuWqQs39r1204o/C13KnJFRBMTu
         19SR9+hDSgU0CC1h8oBYIhkLuaBuJRVSUXjABjOJJd2DGIdj/8joy2OLZ348YytSY22O
         8lfWisihe2ewhIxhtQstSAsPkq+VqLEL67gzBWQGFJXH3VkNDr7tdHdzfxMiMLtK4MKt
         zLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029397; x=1795634197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58b5SUFBCY4/MY2JUfmGH8gHdBS79YyzhPLRjlW4m0U=;
        b=cT1gEUmm+2m2JRNq+NRp2h5COQCsq2pSfqRcvofMpR1/V+fgzzirxDBdEgcBPYei7l
         vfLQRQtH1NmJk8aGGOwowhDMBO+xR3ZTKclwBgr/U89M9RKFWdpAhj3Tt6vAUXIK8dGy
         987/PHdr/6xVx+HJCg5D0SGQ1UAAFHVAQ6afKQlqQsJ2oP0YsZMV8mihe5JdEBjvDhAf
         /jyJt6Q/vn/LIfvtz/e5yOlWho/+wBK2q0KtFTNMiHL1wbSAlWrNJh8FJKaqa1IbUblV
         SGRjMESu+ReV0jhLW4yxqcnkiagegFed8JHu3c2Diqzgi2iQOacfLUUKKfMbwA0AvW65
         bm1g==
X-Forwarded-Encrypted: i=1; AL+hErH/QRQdlUmcQ2fc3IZT04ert5dgptf64Fxkw+uxJ6/cXjib2Te5cioBo60lbEMoZPkysbkNcky2VyS0otg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vver2EBsYOE2W2JkUwNLOYr1Fxg2arYXqUAWlE4rqkLKysbqO
	zPC47gzezh+kIaOOwBDieFnS2YZPlxZ9/dz+DJiGg0D13rxwGFjIFTjW
X-Gm-Gg: AYBFou1AlcHwLOnpNLM/vFC96jYVOnwIeYc/B1kZHfkH1cFk+7swxjIE8HnJ9lS3ZMP
	/qkKeHbhCkAVxvNg3/RUafTFQ7bLq3F7QHtnOtS3blsCC0do1ZGdmmzi8a1y0HvYgTPU+uhwRBV
	6qFWE6udpIFA20yCQyXK0+yIihM6b2TarCIRZDiPsW2dgC0asUxCItXl+USPKzdOPzBntfqRBTT
	A2qdidx5vwswpoq9q5yUHaLCDefXR4UBwqv3O9U+7cdIh6Qpy35xt5GZTTzKQXVO2nppLD7IerK
	dHcYLF1wCvguymM0qaIIgBVw8pv2mhqukXgnQXex5jPVZSxGms5Hv33UcEi2n1HGq26YAAB8g3U
	0ORhPjYwWf7QRbIQBmtu5WIU/35U0C9OwPAHJs4BHXT378fvzBP+mIcoF7HQMA90yok+5TyK5Jq
	8V/E7wYN61Cv2YBcfZjAg5+5phNTOw/S3kEVvx77ODEaoXsgeXQ1P8hnpw2u6M03yFpqQ74Mczh
	namJVLF7VVxK6qh11CZRqdxGTXXtASPfbjYNtEICFj57LKMAqvjjI0/62UXhGNhTO7i9shKPwPm
	2eZzhtMt4mtwHI2vgqTi25hWwy86qVeqCcir6rKZg6xuTtvNIAb564tw
X-Received: by 2002:a05:6a21:b8c:b0:3fb:1091:bfdc with SMTP id adf61e73a8af0-3fe97bf78a2mr3539072637.37.1795029396924;
        Wed, 18 Nov 2026 11:16:36 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm453228a12.12.2026.11.18.11.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:16:36 -0800 (PST)
Message-ID: <65c24a95-1087-4f30-9f9c-9e8636da211c@gmail.com>
Date: Wed, 18 Nov 2026 11:16:34 -0800
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
Subject: Re: [PATCH 5.15 0000/2214] 5.15.226-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261118150009.797899913@linuxfoundation.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261118150009.797899913@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:27, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.226 release.
> There are 2214 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 20 Nov 2026 14:55:35 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.226-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

perf fails to build with:

/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test_truncated_branch_stack':
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:358: 
undefined reference to `__evsel__parse_sample'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:360: 
undefined reference to `perf_sample__exit'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:361: 
undefined reference to `evsel__put'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf-in.o: 
in function `test_truncated_swapped_raw':
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:406: 
undefined reference to `__evsel__parse_sample'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:408: 
undefined reference to `perf_sample__exit'
/local/stbopt_p/toolchains_303/stbgcc-12.4-2.0/bin/../lib/gcc/arm-unknown-linux-gnueabihf/12.4.0/../../../../arm-unknown-linux-gnueabihf/bin/ld: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/tests/sample-parsing.c:409: 
undefined reference to `evsel__put'
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile.perf:670: 
/local/users/fainelli/buildroot/output/arm/build/linux-custom/tools/perf/perf] 
Error 1
make[3]: *** [Makefile.perf:238: sub-make] Error 2
make[2]: *** [Makefile:70: all] Error 2
make[1]: *** [package/pkg-generic.mk:286: 
/local/users/fainelli/buildroot/output/arm/build/linux-tools/.stamp_built] 
Error 2
make: *** [Makefile:29: _all] Error 2

which is coming from fb1a8ab598b3 ("perf evsel: Validate branch stack 
before byte swapping") and 2bdbf51d3627 ("perf evsel: Validate RAW 
sample before byte swapping")
-- 
Florian
