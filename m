Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091591;
	b=SJHFaCBNfP/6Tow2VEMz0t3qMqLwDVw7iAjw6rrw6NpfaNQAacTApcyg8sCGi5n/TDNp
	 EOjXjES6jWuSehnucSOUYNHH+6Su4Ocaxbeb9f7rax9RKWwGKfuWf810cQ4WmzwWl/SSn
	 Hu8ikXtnAMfj+Ua/CmEYsky81O8Ys3ncZcsmoCd+6NQNhkZMJkQBTLYugErSS0kAndcKs
	 O9pxblI6ipTX3bGuYHowG79Scb24W4QSP5+ExGqY/ho8P+RiHdV0o75UQ4oxZdJg+9sjv
	 nCgq+xgDTY0j+szzOKrP9nyHHTbMBRQ7+qqLq96qN1c+mhH6fYL08STwhRdSjh1HJrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Ek51XyDqjNDlPqGg9sQ2tY31Qy1aTTiJyOPg0VSi+0=;
	b=IFc5gKzdXNEip+SN9lGuArLni6+hFmAm7Q9FLs+QI0ohF12qnFHeMZ6f6GU0RMIXpDn0
	 nHr9ewp58ozxkA+O7SacG7/sb44tZ+wOThMYnHi6B5MdUaRvGnkhP/SYzyvtGHhu1tK4T
	 3S1R2OQO357sYzI5n7kqCjdwKrnQd8zP+KHtjkj9B07nrQLeS0J+OvUa8vvh75033ijZE
	 JN60wlbOtKSWlXmj/O/6U8D9Z3PJrWWe9byMvaCY2+R2gk1f1fI553injakBcRWPcdj6t
	 0nR4l2jhHvRgZVII2h7t9r2QV+42RVjE/vB6tMg1bgK0UdHJLrjBYYnDLEicYu+6vBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBYexjBE;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F5606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3F5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBYexjBE
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363c8de563so23546961cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795091590; x=1795696390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ek51XyDqjNDlPqGg9sQ2tY31Qy1aTTiJyOPg0VSi+0=;
        b=uBYexjBES7Nf6QiHlndF8Ui28b0z6/g64un3On2W89+fozFTQDUSEf2bEPEtd7T5pM
         eg3n3ZZxVMd2jbzC5ya8OLwGMi+VKqz5hj9eOvOlYqGZYjAGmgm8wymDya7TYIKr3slT
         vDATIC76ZQx7z8cwBByKunj9tfoiMatxWj2ztHkEiyJFts0q8oCpiuRbx9JHcpycHp0l
         MDlIDX1i1BvnMfCbTsRegYWaI4wSVO45A2mPir5aAr8TNLrzf7lHyagID2IyYPny/JRO
         TvyrGi+RU7wPXYZAsGTTa+mzT5EnV4YIsaxmXTDeAmu18B0yo8aBLa3bml4OZgle7l46
         6d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091590; x=1795696390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Ek51XyDqjNDlPqGg9sQ2tY31Qy1aTTiJyOPg0VSi+0=;
        b=Ju/Sw8bp8YynfHFg7bm10eEJTiT4vm2ldVpArJnYcUCi1Zi/Ik/Qqur6MNV293EJhc
         gyJ/DW4HySE4FKNl1JL2gOQniycR++Zb6Zc2cTic3l+f1SPat1b2JGAnZZ3/BynkmNXI
         ga0WIHHIeDnNUJNQzMsYjnebZHkpKjfGKE8Lz3X0Inf6Su6wENtGiYoW907KBCw8ggaA
         A3wXxh1/JgTsMwyOzykM551jNSgM4xMSzfC1qQY4/JjoavA3h7Y7K7f+AQkBgPX0tlET
         9pvs3RSZy/1++tcSxYWx2mv3eQTtteYvsSPCpBx8NMV5TC0hSLdWWELyLnPWahia3adk
         JS8Q==
X-Forwarded-Encrypted: i=1; AL+hErHcH+mLc5aP/1viEdLiDaVG+Dnl95sqCSDaqBZwi1lAzmi0pA4Yg/WFAmyR0ULLGTzWxtn33vUuDO6/1Uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F0lCkG5TzV9+fyad/JqeFY/2QHIw+D+aXV9Ubb19rmm1U2hbZ
	C1uYk0NhROG6Yfl7+VkN57cupB1aNjUFZWM01ESUMhb4xqwfol8kZBRVuD9OxSWG94/dwKA=
X-Gm-Gg: AYBFou2UhIYptiH60LnA4kZFNhlbgw+c4ijQ303Y/U1XiwYoi9D6pM/KBLiSw9YL/VX
	5noAjQ9Y6Abeduq28Josho6eClfqoV3YlTWfEI4tU3c3RQ8WGluzJlG+sZCvIEr0SU00y4NTZ67
	2VjgQIDlBn3ihTLSImmokvKeeueC09MzAQ96WvJUJg49RdTIQf3EHiNKHz5bTTJ6due8jb5GKQq
	GMsmN3VcCFurPh6WFut5b6i4Xi30Yn0NdQE9AP1W9DbVYVUJoRNyWb1uxVXr8fzsIqSguxvOpI0
	WOS7TjPAq4sGDF1XlJVsK+kOI4j7bHKWnqQvwN9z3TM1hCW+VMoSIJ8SHcim/SIsL1NgS4zTGkn
	QTKLwF+xWmzw+em1PCcccZIkWRzA61OhVzHlBiZUVNEpjxYiPQFZr/QQDGPoNCQ1qvSkLYHcwcW
	lyVahs0Yc+mjjDsMLJsLJszzUJEQyoM7IYcDGh80qzfDQ9txc6j6a+2mxkcurdWxbcsilr0cuyS
	chKLalqjXr89USNymuPqgB/xUTZHlE+KIgau960tX/e/kz44sZY9C7t/qPre7MyFHfjiIJjDRao
	yJ/PxM9oWc+/uv7AX/mmZFf2AWUFBte3u17snSvIEUu0jakBwfr4CJ961slLwPq/FJTATpt/5xf
	Hv4mQKGPISvErKg==
X-Received: by 2002:a05:622a:651:b0:545:de78:a6fb with SMTP id d75a77b69052e-55d5a5b4e35mr96272451cf.33.1795091589892;
        Thu, 19 Nov 2026 04:33:09 -0800 (PST)
Received: from Ixchel.lan (bras-base-mtrlpq3328w-grc-1-70-49-63-180.dsl.bell.ca. [70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f58dbsm48527616d6.6.2026.11.19.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:33:09 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 0/5] r8169: RSS for the RTL8125B
Date: Thu, 19 Nov 2026 07:33:05 -0500
Message-ID: <20261119123305.2459069-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111220114.3863505-1-montrealtango@gmail.com>
References: <20261111220114.3863505-1-montrealtango@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Heiner, Javen,

Gentle ping on this RFC. It still applies to net-next.

The question I'm least sure about is patch 1: is the RTL8127A affected
by the same TX descriptor race? If so, I'll send patch 1 to net as a
fix on its own. Comments on the overall approach for the RTL8125B would
also help before I send a non-RFC version.

Thanks,
Vlad
