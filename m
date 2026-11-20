Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194119;
	b=bFbqhJ5RQQarF1JGdXICJkkNFo1JcvVhb83mtt/F29234fUQqCz55qFi646aVfLnP1S5
	 /rfupnpukaXWYnGEkliNpqoE2WSefDMAxd3xe52k00JyzyZLFtoS8jjFQP1FAL6p49eUw
	 rGuc4SKOIH+eoMJSfT0daO98dL18oQIx+j4pPJhKDJtNhFAkEMxH5LrROF+kq+epxoLJd
	 /p+Gv04aj68Y98FGuYKZmcBE7zwAERtON62zYS7SE1B1Ia+zMG0IIXCaSdsmGJRWHeZVy
	 FbWoXmlcIQX0jk8gGnkFEtfxk0yXhNNzeOSeM+BYKPzKHWM6DbbAp8bn1XOGhIs2F0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1j3X9XK7TxGWPCUqQo1mBVdD/rjsvwmzSCwLMfVCvYQ=;
	b=Lbu3pOiAWwvJAQVIGbQlFvXYGPzQu06FCeOTs+YCELW/8k1G0nv7KtENW/856Xa2479P
	 K3rHMZyqKeOjtfONHoWdEw/8/ivPIC6DkBhW0THRn6LQdW4Gh/DxVlfZVaArNwvI+jpbQ
	 XtxecS2K9bPkqrSQxckj91v/1fNQQrF4TwZAMjOHt/J3DmAnI9oX9A0OMJ+BNT4n/H4UD
	 eubWQfp200n2fR9jGuGR2MG/sYZ9mdQAmBWb7ZtHRRjcJfYOxDj103VgKBa9vRR2rbhCk
	 UnycmKqeQ1fOfwPPVl11G/aHX2jYKWJGRiR6igSq2sT62pw+FGgB8I0LLLDzxeCsm5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v52Q9+/8";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0C606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A0C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v52Q9+/8
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8336645e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194117; x=1795798917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1j3X9XK7TxGWPCUqQo1mBVdD/rjsvwmzSCwLMfVCvYQ=;
        b=v52Q9+/8Dklb6h02lKEf1SbWbT7qXj1sPUSjeRePBdYsWDrv5030oWp+fe6R+VE85r
         Orw9/7uklJxMq0jYh6yZ6pLxbNZSH7GKfKKYwAFtGE2skG9QrgMqotXOrikTd2eYb1Lw
         RhAHS/B8cVgqpXEwOLAeYM/I/Bk7uzb8YNH0F6d3K396nLDQDe0y9hJBS/59EsjHARJb
         PCIdjISJLpGQ8WHicipYKBW7z+3wXaugJG8UfGpwNlidzRvV3r3J4JXdmKS2yWv2QCEq
         QyJr2JvC4U4gStYRPGDmhOJjzshERYia5wT1Q4dvjpOI2uvXGiSg/xWadSeGbkjYFDdb
         KzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194117; x=1795798917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1j3X9XK7TxGWPCUqQo1mBVdD/rjsvwmzSCwLMfVCvYQ=;
        b=VAQkHDI6wrWO3qnkEocRMLPd0X553k4iEZdGHcqmYsPC4xiN7AuC3P74sPzvrlYFgm
         eQxYDugo1Yv5d8qbJszjzGQM2Or1oC5u14ZfQpLlZQmfGBt81KFZysakRU0upXwSELlF
         Esvh813/1miEt5+TXkjadLIxbOVd7+9RbjBXIT8eWzw+MVzfUb7crbfTDln9k9MZ6hcX
         YKz846+xD3aA1hc2l100fUrvpLPHf4lE4YhGZXoUfd/Mdmhuu55XN9gqbQE8AZJ7gkha
         iF1SbmMzatcljFSiSp5dnRT7uBQuqYRzinGH10CDE8G+QjEz9viT0c/9mezlpwh/MsM5
         HTyw==
X-Forwarded-Encrypted: i=1; AL+hErHWMvFg6jXgzZDaJYcDYjimWqZFUMLj1T4deNIG51cWf756HvuVzCaVdjg3mB3jPUkiRuLjX+QwgEDYCdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hpe4M4lY/j4lG3F0oF1EurpsK8eDv6se95D4saveTknfWB+Ih
	1vRcKmRms0YDO7X3g8Tjf+BjCL+eNj8c98fCN0mmVFs4jAuu0kQMPQR9
X-Gm-Gg: AYBFou2VkJU1b3/5o+A89bQ2y/L6VIcyihpUVOCt0etycKNVROAu7JL8PxbOiURQqxh
	hKsBwvvsXJu5N8VnbyE+NLId27VdK/XfxB7NPEbeEIw4Rt6Hmh8fUqlDqu8IVrTRBeK+3Dg2rQM
	CFigriNGk0JUxBZen6oIrtdpw4K2cnYCPlW/k5Q+jY/MCF3nXERxLPjNgmw+k6UeLd5ptPJcyVA
	0utjUnXrZoKpY3RkBJNkhwR5EmjOMyh2/UphtjQX7rT5my+zXCerPPxXTgqeSCvnkwhVAIHI8YC
	WBnn2Gin8u0gGRHsTM8VQf+8AdADUD0GmK5u1u5k4AceY0rznGEDkOUM1viJo4vLVZsTwJBLs2i
	B5zi0ZMZjeqKAa54zrUhAFZBLlFbWs52acJBaYjdPpxszE8C/ViY2BifCjT71QnlhoIr4Ubc8HJ
	5XWFdEK/MKYOpr2LM8+cvc+oxl66zRweopbu05s/kVOrb1GWthsLgFj9tkTRIVl8hwcxEYnLMSo
	PHOiKkuoSUTZ5ohHWnJ55OY9Z0TOGRXIexXKyDI89k9TddmFjRb/ctnWVK26HZWwjzPv+Z0Y8LU
	dbsMIGGBmga63H6heTmrGt2oc9j7g6OzE88=
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr81948685e9.17.1795194117022;
        Fri, 20 Nov 2026 09:01:57 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm146540045e9.3.2026.11.20.09.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:01:55 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 1/5] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Fri, 20 Nov 2026 18:01:54 +0100
Message-ID: <20261120170154.374502-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120131000.33858-1-luka.gejak@linux.dev>
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

> Could this skip a download that WoWLAN needs? If suspend flushes the
> recovery work while it holds RTNL, ieee80211_restart_work() cannot add
> the interfaces back before rtw_wow_suspend() runs.

Yes. On an RTL8822CE with net detect configured, a firmware crash
forced right before suspend made rtw_wow_suspend() run with no port in
use. The download was skipped and the driver logged "failed to get
probe_req rsvd loc".

> I think the empty list warning can still happen with AP and station
> interfaces on the RTL8822C.

It can. With the window widened by a test build, a station interface
brought up during the recovery got port 0, and a queued beacon update
then hit "Should not have an empty reserved page".

v4 follows Zong-Zhe's suggestion: the reset no longer frees the pages,
rtw_ops_add_interface() frees the old pages of an interface that was
already initialized, and both port checks go away. The lists then stay
filled through the recovery, and the TIM update you raised on v2 is
not skipped. I will run both tests above again on v4.

Mehmet
