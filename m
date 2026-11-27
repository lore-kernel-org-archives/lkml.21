Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742614;
	b=4JVBbzzO8A7JXSh5W+VXWBYObZn2OXfsPjAAloIO6OafNhfsFYYM9x/neanoi/01E+JG
	 4Tp/zsgwLg46uwns4SMGh4cpsAWAhNcaK0eIUGL92ZeGCNsDaxZk8gfd0HFao/LTe6NML
	 6XGtEik17L2IPvzfMCvRzcEl/4GXat98kZ+Wb07PWuACYfW3Wds4ZlQZUc2BV9+qzSZHU
	 rybKJBaBz5Gr49R/TkzKDkt/+7YoxjjYOO4CkwrWJS+qDsFy5MC4+1rs7hWa/eJ94rc2h
	 ERV7AED4plK1H/orLredPksSAU+8I9Ph0wcrMS51zBo4tuVaKhaoFoT2E+0VROcAsSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=m0D3Y8mkojMn8kpD0m2n9BecyssVqApB7/PKctN5U4c=;
	b=JruH36ZWdv8/UHYneJO8MtaL0fCaSneXMnZ9zNp07R4jyls9xDlDlbU6wnzXUVoNLQsD
	 jeh/5wyXzAUmuPUEetJTkPz6MNeSrQobjWbXKsg9oE6MKM6NTCrGuzWHj6tHe3In4rH01
	 kLPINzv5Z3iBHdX1wAL8Yx7VFY5fAwLfujMiUf8UJ3swZy1aFNepfiICL1fXq8ZhqPfj6
	 KFuHuLlCiHiFVJQo+nTyl81ye4y5maSQ9/BwvNLex2ziIMYVcvvLeszeYeDEffVJqdo32
	 yQbaCg0b3zlmZNaThcPZ7c0dNDuAQFcGdsx5S33iMi0aZ1kMfptyhqdQa1wLPXtaWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3+k98PE;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB27C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3+k98PE
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdeaf4ea5e0so1223380a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742613; x=1796347413; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0D3Y8mkojMn8kpD0m2n9BecyssVqApB7/PKctN5U4c=;
        b=S3+k98PEmDcReVHhonVbTr7m1AGY5hbcvkj/ef133v9FRCmT/uq5AVtj1C4iCXMI3S
         c3FrM6h1jA8knldRkHlb7KeZVX78ZsXrEDFKDhGnqTxAhNojHs/pb2GmzwFHqIjr0bny
         IesnzHAo5lN3pzQkOw9nMPTsdPwr6tdKYBm3ynW/WVj//MTNLoyHcyvmUO1lfTmEMPqY
         Exnvi8aC882m8A1LQin8y1VVBWVLrYQdREJ1Z1A+zoRjxskFGKAGdqlkZbjM0wO1xRN5
         XJmwLNz01qWUQ/vpA9xuSGziMFvCWzjk7of8Di63xXzri6J6oQN7DnHeeqfZmpEEs4ma
         rKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742613; x=1796347413;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m0D3Y8mkojMn8kpD0m2n9BecyssVqApB7/PKctN5U4c=;
        b=My8PjKq0elMkW4MjuwcSlIp/gqh+vBh7+AdQK1e+wBtCnQIMOdobTNkI8ZVrATam0i
         feKmb7t3NlNtlsqmVe8L5BCu5034nMDNWPxzqbnWvujEyrfjDTJkvb+pFKqAIXeuCFQF
         ccaxMsJC00qMz1rdupjPOJAbKdQjzk06gxtbY6Qvj33K22yNNHHDLK9ItemMNnrtCHSm
         ISbtUA46joiLqqFFT1jAVBxcaDoxTTegSO4FXdSuglM+f957ckFgLd9CFU/z1uY5f2Ek
         7GNvcOOOe9YOX8jd7Lp8W5ebiDs6QOLLLPsryy8EZ9c2g61C1+vh/ayRopP5Q5tA1zbo
         9aeg==
X-Forwarded-Encrypted: i=1; AL+hErFPinAFRkPrMzwxrlnVDCF/Gavec3f7AfDcOuXBNISXaHTI7U8qnHO9Gci1EmCt7pBZfSxXVZQBrswlfaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oOMgtZmbATdSRc/5WdmMq3xFD+T620VF6koUyu06F5miBHKJk
	UkZswUjmAXL4P2L58bbEdl4qGOFG6TouXWDNlY0rijO54B6yO135rgX2
X-Gm-Gg: AZFdTZcJ0V2jFgj/800ouA5chcBO7UMf2Wc0I2gU6JNnCE43/it7vtNKBLsXXYtLroO
	Hs7bvM8OQjfmxX7ACQ3cTDwhqvDSCSv0nf2jY/p9zrepFrWkNqVxmIq0aOSiLgrsXB9m1o2mp0y
	JnHgkEoVNJEIh+j8nvPlvwll6SS3v3lxVNgh2siMvaStZYInF3QmuJbldZPdT7V+t+VGMRNp81l
	wlWapZzwpMLk6ZRGTu1VLQ1EmKBep+7FLTzUr0cOg4cArTRFaGXZCtOdzY8/1o8PkOC7ufzZ0C0
	2NK32buUeUSxEJeRwho6x/YVgtwv2BhvINxeQnVMH1wCO+rWR1FI1+sGiay44x/x0y8a+AfcPOm
	JC6hMmbjGqix7ztdsfuj/eHFMiCi0kgP5npRqVfzcwbOkDU+lR+vNjv+QHy1upsimv53EAq6SOX
	agGbC/eVjEgu7NX5Hq7l/zcUw7swqVVkBWxNB5w19Vu9TV83rTvKyOHwW35VKYb90iaHX+GaJbU
	bO0jfc1lZqdhXXZdGeqUue/bnEewSo+JitFnl8DUOpPf78q3ebkETLHVUp0HOqlmV4k8QKkbd69
	QhJ0kMjsDErPhWRp5VvzqmEa2+d6SJcZbonJd4JSwaWxw741W29/F9d9wCjFcrjgpQyDVq36TYs
	=
X-Received: by 2002:a17:90b:2e4b:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b41c8e0ce5mr14432697a91.10.1795742613003;
        Thu, 26 Nov 2026 17:23:33 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm38459035a91.2.2026.11.26.17.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:23:32 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, Arnav Kapoor <kapoorarnav43@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: inkern: guard fwnode_xlate with info_exist_lock
In-Reply-To: <awhBEfD6I5nakCKJ@ashevche-desk.local>
References: <20261126060615.63790-1-iasnezhkov@gmail.com>
 <awhBEfD6I5nakCKJ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:23:28 +0800
Message-ID: <179574260890.61388.10862990171445957182@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Andy,

Sorry for the confusion — I did not ignore your comment; our emails
crossed in flight. I sent v2 at 06:06 UTC (after Arnav's 04:59 UTC
review on v1), and your v1 reply arrived later at 09:19 UTC. I should
have replied on the v1 thread right away to make that clear.

I will address both of your comments in v3:
- place `struct iio_dev_opaque *iio_dev_opaque;` in reverse xmas tree
  order, and
- move `iio_dev_opaque = to_iio_dev_opaque(indio_dev);` right after
  `channel->indio_dev = indio_dev;`.

Best regards,
Ilia
