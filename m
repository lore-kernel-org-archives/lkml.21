Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612345;
	b=xS8L17bZaaEuZwHwaG95JEb0p4be0ph5kutWwnh74GX+gl5Kk/NwkIcGfS/Hld8unOkr
	 zVwgUuvE5+27nA6PYnabVSVpt3sonIgwIu8M69tgP4mHDLWKALvVLrt3IlUSlL49OTkkJ
	 7DedD7mv/zaePHYyuHmDSrEpLZOYWRUBm7mb/iMCcnOYbZKMbdm8bBGWWaGTEHChbVISM
	 CQyEfG6/fEMmt84KxktDgCHENwKcrBgNDnS1P0bru3WJ4/EV9LvbuxJNkJt0s0FZjYMmx
	 9BQvvsuR7OxOjE+95LRlcrPctsVh1CEsgSLxUC298h4zLaWrGnVpo/9E/7tH/Okgcrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
	b=t6IimvD9qgnLuBTqYDRBZjmUEllse0yfDb0sfCAuaR749YFvEDeHR/kpfBj0hnmQa57m
	 wOLXAboCxl091Q1WELLLvC+5WDAMfQRqwlpQ+QHjB8zPXYRt39XX+1ru7GFU0GUphRYEC
	 6RxW4GpuyLBw0UuWOgbAtiqRwEG7i67GngLBhN2JXwDjohPjcroRBZt94WFiZgbYQVTrJ
	 iSnU/Cdh8omfpK50BfavGGRQsk0YDFH2XejXPNyT6eZ8fdRuElyDUJWXCygEP1ph4EEeD
	 2Y6XmfZHS3qpihEQ81qcZ3KN0xsxQ1ePsM+Og6Wpra/FAOVmtF/gywllY3DoJIQ4Tmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D305C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D305C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzOaOKNR
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55ade1de0b4so67293801cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612344; x=1796217144; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=fzOaOKNR08ayDz631qIR5YM6RbDX4cXMRZT7PE5kvvn/ZKKFy8OqDo0kxL/CGZipfh
         yXsGpHHPH7x4KIMUFiT0hBdTKg/FHDQ+cFEBZ56hKsPDzqho3JjjnjCYeAOgQuhqrCCx
         Kyuv2Qgb2LwbL3/jeN6fbvh05cZA5VXL+0kBnF+1toR/jZjXSZvEN7CM5ELf3o5aREvn
         Eluy+jaX3sWqlm/AYzmzvCNEWh8yt3FwyrbW07O1L9zQIfpd2BGAQi/jkH+nk0STPApP
         ptq4+5w9OImGltbnF0OW7sw20wlbr2yCaaAbLC2GzlR8rCvoWGScBAMjYdoKnZdgnhiD
         xAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612344; x=1796217144;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSy0760iv92AUsgP20PxMm7qkWdFkHwobtNBYYjUqJ4=;
        b=JBfs8hT8qZVJtEcum4QrNx8aQRwPbskz3q0zkg6g7FdmWBMrAU5rod6P0I90pJHsRk
         HtqX54zAsNmkbsjHB0apDwqc0ZwCUe7NuZZGan0CShRkTjD+eHGro5dh7fBlYAZ9Qfb6
         6U31thXfHoPoTwClHew/rJblGn81VJ+Y575OrSdatnyK55PsrOTrRd4tj9IVDPMv9LMo
         3XKSj/YBGkF+Qu5UkqiGQpLAcEOcAkGvshlDyxszOJOh+EmQFFNz0wnmVKL4H2Yxqp3a
         0vsQhI2e5egrjbGeC9H0nBJiuJYkcm+NE//GvPhuErkBLvblTFCscVcQV7kpNNCTwsBw
         toSA==
X-Forwarded-Encrypted: i=1; AL+hErE7Q3wo/QG9rn8QjSQiz288ocoW+C2+UdvA/kxx7NKB24y7jzkbFzb2MK0etT+8X3uiBNPysI+ePcZOmss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VROvXFDVBoRZ+amkFavTjdh1/jcEq/nzSDsCohWGn9GuTNFq7
	QkAYtavvQq4S4QrwrMgQ/4aSv1sfb1hcyqY+j+JNUqMrDnfWqFmWHwU=
X-Gm-Gg: AZFdTZeY8L11OdVaYIuoYJfJq/syxaLhyYhwKGx76TCXbYrlwGpcfXJoyaU/a9x24GU
	qHFNDJtpaEt4ETkCKxnozsth6L8obecflp9UYKWemqy8duvCn9Lz5yMnFzZ6EIv5aGOpDY+uBGu
	6oBDI14jxhKuJMIqlWDhOrALAJrS+/GhMRjxKlMvJcMnL39qPncKlNI4Mv/ZV/q0FRXLr/dPGLD
	vXhN1ilUFwlGad9wqM/CG81dePDvvG7RFnq6XBD9Vzkttt8/JiXszuuMd+7YFnBs5mIzQh07xUP
	xTaHNq5+9Um6yhSXkWwb/TxfFfPiPAhVms0QMrFHJrN9MMzatGt7frEifPLsVsiLbnX5iUXU7oH
	qkn8jB/4YBshgx177k35yUsFgNnLlj1jqmNHZfSy7hvtr7Dpp6t10+7NxP48J8tLolclbCMaEnf
	u97LsG8nCFscp09MrwqWFckpompTqUsZWeHACU1v0lhWZvtm5YE5w2aj6HbwMjQzvHpwwAi6SBg
	oLKQm13Jp35+Eot8lPR1DoPd2n8IfqyqDVt2wvPzqEVdFA7dr0Ag5JgopqhM2wKB6j5jhk46BTu
	NwH2BeoPirzoyo5N88tQ69JHtC21k673FwATX5lcJ76FvMyfXj+ko/2/iTTnxboV9OcIacRjmET
	03tAXMOpfKvptlx6L9gQCLoKnd3zwctrlhbhb0E/tAX2Kr+Q1oWjmCXD5qWzlMkYCAzc63Q==
X-Received: by 2002:a05:622a:410b:b0:535:157b:ea22 with SMTP id d75a77b69052e-55d76ac5e33mr308582181cf.40.1795612343642;
        Wed, 25 Nov 2026 05:12:23 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:22 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179558107134.36587.13120861622026385297@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Message-ID: <179561234149.225312.4673144866194884043@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David,

Thanks for the review, good suggestions. v3 follows with both.

Thanks,
Eugenio
