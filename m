Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194227;
	b=j0ThmdgrSQajOlWi6wLOY35kdE1ybRuDiZ25oFyH/p9uDYxFA2XdgIrM0nIBAxrui97J
	 38do90n3kDFayzjkSS0+XLqwUHjx6c+nowjP2ov+eo6WlgMK/puWX8exwwW1Iq01Ub43y
	 xjgWoibkibjNG0lMibt55OiLIp4Mo0xtE99fYPHj2wPDuLvMqQld42lVRk23FiqRNq4hP
	 qZKs+cdFp8J/PlSHAX7AJNMkkkmVmcvJCJzw2sPALpiitABH2bigan8cEUxhMt8PXRWEf
	 bQXjWhnw6EqJJwBwMoSItaw1B2s/WDAVsDVdRrZ2UvpA20PrfvYymLDNQDu770ZhuCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JTH1xnpcvnrctSSv/KSrYetey6/zuHKQ0nr2UJcfCNM=;
	b=kqIKKa9sEe2jiiPFcaRlC0OVvOC0RejVgKJp8BVUhuGah46BFpJHlqtx3TSwDKU6K3Vd
	 J/dPSyu3JmasLiTn6XzKeCS6A9d/FREpsKXkUZAi61qn4WqiCP/DvSZGeAYzPMyreLB7R
	 OeTjoXbJ7Pct6+A0qeA/8HalgdLQTIDZ1ZanLY4O+QlAcyYFUHXxWh26jhu7zjkXOvErJ
	 DBuKLVJeVO3iYvcG/F1wTq0XLnPu43OOnLIVIytF1BEvhJ3s6AFJfxt+S4GA2cbL2ilhM
	 x44BXX2Lrpixcn9mraRfauYECMIThyrKgkfmmXwMcPYGF2GsiUeNbNLvFMqOwh4XxwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEoHfiAe;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A1606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FEoHfiAe
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4aa5833c263so1016328f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194225; x=1795799025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTH1xnpcvnrctSSv/KSrYetey6/zuHKQ0nr2UJcfCNM=;
        b=FEoHfiAeXbTKoKcTTWjrudkgxZzqoFkjZFkDIve6OKHhNkR8t40F0+k7OmcIhmDvBB
         0LsZw9KCH8472aTWAt1Ca31aHng6zbhHJW80OH38qQkR8IX0gOY6J00MtxCZ3hTo7R6/
         SkON/RnTrD6W2StjPTcHVS8puS7NiW/uiYWuSlK5+CSYoqmhDLBIcGULW0SOcyzRRQVm
         fvnBCaGDpZzqwN6pU4tCU4TpbW/FN+Hku6/x0SSQTwl8ZMXF4W9VqsSH6h7PgGlJEr1t
         +tYTTPHWpKKXL8hdH+0wpWVIqGqR4JGAWVLG6uvgukfFeOUi4rN90EkVHAl9B1xugkia
         Mb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194225; x=1795799025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTH1xnpcvnrctSSv/KSrYetey6/zuHKQ0nr2UJcfCNM=;
        b=0QGi1vnOpSG2CpqrCKihftuRSCIYfWYqlMoADg5PrvWhGa6wJ6tBk730etiX4o1pE0
         l1I5fJKPlHigSrdmg+cPY6Cq5TOlY6lIYT2IDE0z0cndcobRlf3Ut1NeppkTF1EpH6I3
         i7jEGfB4cr+SYQxIo0BtewLGvlVbB0GJT0LZXBS3iLUY50oT/gzJELJYy5r+jeD2uXRj
         RIRjbuQj56y2lTtKQNXU8ZPWqgQ6f6scpoo7vVDpVJMlSiDC/WgfYEBCnhnTzwigO1YR
         KQHMP2nKXVNs+2o/rMU5VaJaFPgaxox5u40EUKGcEx00F1T1GfgoHCjonOr0LwH1xu7r
         nwcA==
X-Forwarded-Encrypted: i=1; AL+hErFEPaTVDeH56jIHn/2kmum50/uOzKcroS51Js6R+WFvZsb2e3ALGxnXxAVbJ08ANi1QNowXmaF1qTbRCBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ccPXV7v9YHgiE47n5BP4LEJIOnD/hUn8hc7s+peTQ4KWC07j5
	WQHcaFFNGPAI3/zi10INwKAY+Q/4m1fR0htJWFjsDwLMOBqIlxfqoMt5
X-Gm-Gg: AYBFou02wHxX7nh5lNABL2uVjiFUKIQ4t+noF7sm1w3GOG9IPURpYCg9rfhcYuqJOg9
	Pt/Jj3jgXEP6K8rN1WRPTZHj/rN+1+HffvGsdo6GDPUZIOAHaj8Cn5FgXmJmoExyZC+AE0BdsRz
	GLM8dFmeYWs0wcUBuQBF7El31tRhxvo3d9vhyyOTwlNFxZvcb55oWmwKPllzIIWgoFjz1PmOmto
	3pa14iO0Iims+tvf0QwrayJ/oLj0Jp8P6gwvWSlc3c3jsIvZh6ArWiODMF61Psh7M7xFzNO3Xz7
	rBoJEA0MH5drnBBxy5UyHI0SfjSgx8sA7EL99SLQP/zfxy1Te1AhcJZgcImZG2HBn4aORFO826i
	aLgjdSbkRXuF6z/kXurltpa7t9Nvjb0b4RSOWwg/7cTP2oMwgo3m0LMvo9XJjI9Bj0Vs0UfJgdc
	d7lXCFXhilnPqnl4Roz8kFko4N97fLxnbmXFN/diD6HIuy7NNLFU78hrZPGc0R9aIRwIoPLbzno
	8DUj/bGpyqdSQPaGRVtaun3JROvfwVn+hoWFqQXqLhsbDgUgZ645zvFGpK76wxW4Lqo0EaTuxtW
	OO9+OAkJpkD/BcMx6FDNZhNnt8kN+Hvf1b0=
X-Received: by 2002:a05:600c:a09:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4bb88829115mr82707195e9.35.1795194225495;
        Fri, 20 Nov 2026 09:03:45 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm79704635e9.0.2026.11.20.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:03:45 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Fri, 20 Nov 2026 18:03:44 +0100
Message-ID: <20261120170344.375569-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120141554.68116-2-luka.gejak@linux.dev>
References: 
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

Hi Luka,

> Does the short interval case need a smaller margin here as well?

Yes. With a beacon interval of 19 TU and a count of 10, counts went out
two to four times each in all three runs. At 100 TU each count went out
once. v14 will size the margin to the beacon interval in the queue and
hold paths, and I will repeat the 19 TU test with it.

Mehmet
