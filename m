Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201011;
	b=NqLazHu8XcB7nWfCsbLL6G2g/3Unwh1lVsWm5o8bV38BF+xP4tasBcD9O7KqT5Fjpq3l
	 SS4tVtjxVApGmsphrqsIFJme75SLldIeW51FUnSVOnH9SMEgOolF68X/uhdg/c88WrCNi
	 6oDNpcef/cwrvxlfOIDQqA7K/2la68ejLui/xF7yOlJSi3Uaz7zm7CsDoYVZG0ePe9SOa
	 UoqxKojM04Gc+PXLuMVJ72mQH7pWIUCBUNnD6taxCMovdiUqroiQMWPOEIYZ//YEUwv8S
	 Ph8ENHDl2QzW+//pMYxMc16a+aE2LjAB5nd0qtcnRqWG90k7XzFwqCClm60VqKA+LUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
	b=cVKIW9S07+BebBoRry2OjNUnZar8kHyetCyrQaguuWdCWEM2VKD7QVfPDLo2JYYIelj3
	 jJfwM0XerdiQGOZHynp+EHnnxI0iHEz6ymSoy94pZ93Ord4/G+3+h01IGpiWw4Khjsu/a
	 EdGjtU97s1ERIX3DwWJNrf1jUg+QiV1Bwo4LvH3IoaCHKv11GF6hhsvHlI0gsSLUQ92FZ
	 tF9sPI7/XC1iFygfys4LeSdQBc0ROdOzShgWu50oBE57r/R5iIahuXb5XPKdhFsh8OOaz
	 vYwkW9p3sa/8GdO5gdMQ63uiuu+UWr6Z6R1e1kpLuf0Yrmt5Cfxnti0288IGZyjSQmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935060A2629
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A935060A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r8GQQw9t
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so946571a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201010; x=1795805810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=r8GQQw9tdT3JOh+6FNwiH/8laGLkVWuAdVc6z6ZwV4kBuFi5o/1q6BThpy4rU7X1fs
         TuK8QuWm48oz7IzcriEy8yV3tCvCGN1QU+PjHPwsmFaGHK5OaevpI6Nb7PPxNiq1mr4b
         a+Zg3dqp2LZSApuR250ogcTr0aMkngN70Rx1h8Jlyoa62yEbl5Vkh2BneroA7at+k3PT
         zHec/Y8bHDpQ8Kc9ETuh1CXi/orZMal93vpieAuHFLGBDnqhMgwzs5FOZ7eVUk/aa7/k
         zEWIBoX4cdB/pxY8WqnwBjGOw7lmI38HIYIujaik8O7UAtopthj4VpCZm4/bqwtefwVL
         ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201010; x=1795805810;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbVQtId4GZJpOwZIgQ5IVkC1l8C9teB2jkENg0QieKg=;
        b=Kyu5Zfl/jDfUCOhKkrdfH/VBp5cjzUip9NEvnr66dnTnq6HaWyQcd6Y6jUoZyMBmHI
         +puxwQGcicdFeZgtA6U2j6l7MdjEqEFQ3SxLCp2e10XC7bxhEBkeTtaml6opTK9hgVRD
         /+CaQ6d1M8grncQB6IWr035bwLo63VfpH9JDmG5d95AqcDEl2uhfgk68zmjfFQzR8lfJ
         fwNlbZWPdX4bZy5SgwyPj18v699CChvUa+lB5AQfU5zF3p+xFrYvWiPTAk6lRiLVADlf
         tbthsdGcxYzc00bWu+ucFymnVjMysYagwriSNbBbm8C+FRCcOGeknXY/okAGZLKcXZA1
         EOug==
X-Forwarded-Encrypted: i=1; AL+hErGOR49SKYNbLKsuY/HcybTFvS41J55Oz/r5l9IYucjXKtKE4BjAII3DQmLAAezamY8WPP2zxEQ1UJLIt8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b7qi4455GJt+ExeyTAS1y+mTF9mnWSIdhKgf+uR1KU7/oxEPl
	gc+GC5X8xV7k5ORdrP7yUIUHZsTlI6EQfs0mV0Df8JVxn3cP3epm0H2D
X-Gm-Gg: AZFdTZdhq+9i4cI1/bb5rrVwT1flumg11jr5+N250hGifbHaanNBqCLNR1PC/nzB48F
	k375a1G/XRUUqBbUCHTmHAeqLk2ceEUroybiIV69vBA7uFd/to2DBHOaxTUDiovyP8T8IPpkYzz
	Y5K/6lwtfwLqhkyTKiPDXg42gBeT0CJi1fn3rFpUDa+yLNgZElxsWmCDs7PQ1gn8c03RhzlYXWG
	h6Nr1CKTY88jOzSkDW6Xy92BHvQD8bxYrgayxIfPgewPW6n/UiLEGp8nu3+AifS/YJvc56bUjOM
	X7JMDfEGlHJy9hyFm81fmtS8KQRueA2f+TqNMSsLtsOJdrPVgSGugE/WBgaCsZhxRM1o15QbP9X
	ksimhzJX3nUDRobfq70rblOQgu9jJFj8HhikJb3Qu74l65/ksr2UmufzYweu/t5ULYbEzLSjmR1
	Jeo2fmTvPtKZg7e6/L+32dmNIUKx9MpZ8Vou4tKLbomrdHVmzaIjp+Bpv2rBLY2yjqc3m/grizy
	Hpra/pFJ7ZRVoDCsW2fmiAARHx4vaO+nGCQW10zPX+0gIaasx3lILG6uEEb/7Br8oslvXDCtEce
	jMXfDqKKqQYd6MFzpOtHTVSBV5Ew8tCXAnjBng==
X-Received: by 2002:a17:90b:3c11:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b41c97bc96mr3964802a91.58.1795201009657;
        Fri, 20 Nov 2026 10:56:49 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:ade5:705a:60d1:a474])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm8484216a91.10.2026.11.20.10.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:56:48 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	heikki.krogerus@linux.intel.com,
	abel.vesa@oss.qualcomm.com,
	abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	effeffe99@gmail.com,
	prashanth.k@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com,
	peter.chen@oss.qualcomm.com,
	tapas.rana@oss.qualcomm.com,
	vkoul@kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Sat, 21 Nov 2026 03:56:42 +0900
Message-ID: <20261120185642.1188-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <2026112017-flyover-grape-cee7@gregkh>
References: <20261119124558.1548-1-26rote@gmail.com> <20261119124558.1548-3-26rote@gmail.com> <2026112017-flyover-grape-cee7@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joonhoe Kim <26rote@gmail.com>

On Fri, Nov 20, 2026 at 04:07:21PM +0100, Greg KH wrote:
> > -static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
> > +static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
>
> What does that bool mean? That's going to be a pain, please make this 2
> functions so you know what is happening when you call it.

Will do in v5: dwc3_qcom_select_utmi_clk() stays as it is upstream, and
a new dwc3_qcom_select_pipe_clk() goes back to the PIPE clock.

> > +	mutex_lock(&qcom->pipe_clk_lock);
>
> Why no guard() use here?

v3 used guard() and scoped_guard() for this lock. Krzysztof preferred
plain mutex_lock()/mutex_unlock() where nothing returns early [1], so I
changed it in v4. I'll go back to guard() for this lock in v5, unless
Krzysztof objects.

[1] https://lore.kernel.org/all/20261113-artificial-quixotic-firefly-84baef@quoll/

Thanks,
Joonhoe Kim
