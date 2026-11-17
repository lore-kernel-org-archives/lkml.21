Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953481;
	b=SPpMdAvxLJouhMpA7np/lTTPsrGn8o3gdlkd6Rt+xGLKXAuouSNwEGTXAGVvhVD9s0gd
	 3ihoGcsrO7BlCnnqyHyYD1Cq0pdlpDJ1+KTIzeQa9tOhDpYKZSktVJ0+BnfZU0kN+Uofl
	 vKQlhMnIX75ugBY95xZzYlCjKUHnF7AEjtVVJ5eXsN5AB7z3o47ib2D0pCMKwaJkLSNSS
	 o62ABEez60QpSZHhT9gLtWLt7B7d1HHd/JSbekFg88zkxjEggpk9nt31ORaykpi5m5u+1
	 YuPgJzubLx3Lu9Jfklbwjxv0BWMh8zjbhtUrwA1dfy+kDxJZGBZlIXhFXdMf2ktnFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wmcf4mViIOBztFuD7lQQZhUYPulduXRhG7H996WEMdo=;
	b=Fp+jXNCQykUGvOb5QC2yqPjMwpaWApohvRDkHDmCZCq4IQ/Z1Ez43UU9YHz6useJ7yhn
	 MvVR5yUpFTaXqwGLoCKsJg5g3hNdz5m4CycXPlZLf7E22oBj+37Ce44A6Q2gmmdvTOZ9s
	 3GRM4EpxBqGgVVQ+qHHrQHP3NXuDv3NtbmUKFNjaeJam5HB4yfhbUX6uhKYQRx1/FzBss
	 fpqpuylAX0TZvDqMx3Dao4rxZAYbkb6bs153NTwP9eidTseZJAAP/XIxchpn2QxffaDRF
	 GWIwQlQ6xXB+9OaNjbaW3nOTcQdu4X8jEJS/tU2gLLLDZ0D3JFk6jXZH+pkvDq38H0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwKbNyAE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F13606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F13606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwKbNyAE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so1841545e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953479; x=1795558279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wmcf4mViIOBztFuD7lQQZhUYPulduXRhG7H996WEMdo=;
        b=xwKbNyAEpGluQH9rvCPzjJLKmdbHwziqyoXJmimHR8b0x4UT5So9NotetuoXq5Gaaz
         jQ7a165cGDY5qq75zgEEKil8MWCxOK1096rbl2u/ScaYAsKz85XNma7zgkJpUy3EBZ9s
         OqB6QQAgR22FEjOpHtaQ4vFzDCwkBeKcg7irDTAGUwISRzagKGoUUQge9YN/GcwfMZPD
         E/+KNCWWx5of8Gn3hy94sVncAekUANIDhXUSwL599wRlg8mpmmmc4mCD/LRROOYgNY6h
         3DyGNpLQXzxGCuLaryJPuXz7xqKj8seO2HFqvo0xYtIWKEWGcvIV3sqlFGFaXQv/jLna
         SN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953479; x=1795558279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wmcf4mViIOBztFuD7lQQZhUYPulduXRhG7H996WEMdo=;
        b=ttPqNUUUMkVYj1/yPTHPhVkY+KL8dbN0hgnSg+CVmB04YYbZ/7wa3WPqmGWOkvNHzG
         RzRFQ27vFiTcYcH+TttQ/2artQ/I4RhqR8UL4rwnSphCivC2YiCtXUob8yXC3QQ6bBhG
         JM1Phe0gScUhenLW8iNvy9sh7jutomVLcFg+g6/d2IaE7cWBKlAJ+77QtkYUM/2oPYW6
         MX9hLQZAYTWWVvR3SqOD1MObaA72gJd5T7ndLz1AhxfnxasQpYTVV/XOmZmG1WajfCsK
         YW1R1I4uWOtlfthBadubsyHaM3Igl56f0Q6Sxy37Uh37P/KFg5bV+WO9ociuO2qDbhWT
         NReQ==
X-Forwarded-Encrypted: i=1; AL+hErEu7FDFKCCLEQgpeGDGnV5j2SkSPO6KJrkJhZdpi+PRxEc8NPZXHGOtTSLCAKqo/DveVURUZWltdAngDy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IkOKe47Sli6jrJZcLexloB3KSB0Mi9oQaKzBwA2h2l7mvRiyW
	UPII8cB44zfDevqj/TL///CIsVG0BsVs2UnhH47WfJGJ65nnXALbAhai
X-Gm-Gg: AYBFou2WaMTwR6c66RkMqxqyUd24HxFp4K/716a/+404pWpjr9Uqa4ra+Yvr4lzIfZ8
	ZeEslcWXOw57IvRnDH0cbgEvNVYzSOzSsstiCHrebJuIcYvSMD1yozjYYy+1r/ice+6g2GBUZHc
	+100AMRJFxJXjXj5K8ql2oFa/bvAPCfUzngdLuPAtIH6ZFL+Dl1dH+qNlzrua0Uo+yZpSpEuWsv
	uF26pzYL24+kS5TfUqLgHyWq3Zzzi79vyMOSl1efiWFjfiIB5L6h8UuOM0DJNeKTjegk8vH+2R9
	/dGCF47SAt0tuoBrzTN6Ph/McsHe9KNnxT3OzZbwTrGnmiUHStmY3N0ibvtCkNLkQmnsqJDGsYi
	ur65u2mJxHwxLi/U0nbF14jB3x5NEqJ5S7MPtUPZ+hELvyeN/OeHq/Yv6A4SELNuaE8jJSrBVka
	C416oVPXoBcGN/mygT22wynkbqDZW2SCCTL5kTQZUnnnMFf8BYBnliL3vmD2t7cp9jxEPjBmtXx
	QTmCV8G11h549Lr/fAKaZRcfd/z+LqZmOBFFhL4N+xEN5y25HKkzDoZ/PEZU0lx+fAqAHPxR93n
	pKnbSmXYj7D3wye2qIse1q6aWZrtkragqji2a/fkIN6cI1LCh/L5UcAjYoZiB8To0m8u6YquTxh
	NSGaAfKZ53JIPxEtKeWP8sSspfEbKyX6Y4gh/Se0W
X-Received: by 2002:a05:600c:a013:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb7d57749dmr12502495e9.0.1794953479148;
        Tue, 17 Nov 2026 14:11:19 -0800 (PST)
Received: from laptop.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm99960585e9.0.2026.11.17.14.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:11:18 -0800 (PST)
Date: Wed, 18 Nov 2026 00:10:32 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <uscwfcie3wlbyljcowjvwhto7aecdid7cxjknvd4t6t4fyj5tt@lpyoijsxuduk>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
 <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
 <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>

On 16 Nov 23:19, Andrew Lunn wrote:
>> I am fairly confident the change is correct, as the documentation
>> supports it.
>
>So the LLM review is wrong?

No, the review is not wrong. It correctly points out that the budget
cannot be exhausted during normal NAPI polling in this driver, which
I had missed originally.

It correctly identifies that the old code unmasks interrupts even
when napi_complete() returns false. My change calls napi_complete_done()
before unmasking interrupts and only unmasks them if it returns true,
indicating that NAPI polling has completed and interrupts can be re-enabled.

Finally, it brings up some pre existing issues that seem to be appropriate
for separate patches.

If this patch still makes sense as a net-next change, I will update the commit 
message to explain the ordering and conditional interrupt masking.

Best regards,
Janis
