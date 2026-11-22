Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341833;
	b=SoDU2dRaMmcC5bmba0rz0pplxTv/1aoXvGN7VLR+1rJYcKbwiqd/CeRkcjtB3imUZqfk
	 1tV/tqsooXMfw/qV7SnTuSLN/QOqG8bx5Sn6ufnJdc5fDdnH5r30wfmoITXENiLwjN7iE
	 ENmaSkfEMW8jb4/Iy8ZPhcRkZqf3c0ypxTV5HDUa+qs6ciJuGFGGQWPezER/VTuqPvS5R
	 J6+9vv3a/WocfoOAqS2iCm432RgXpdgvwgBIlmCTEa8Cxt5o7VkmUMKrw7wgN14tQ2ejA
	 UI8QUMlQ2LbyMPQ0nRDv4PUbY6Ev+F13RXO6kSaUwBSmZS/p8lHzKt9GDOqzuqKr9hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
	b=L00cZVDc7qRJiKqATlQodiyeFFh8towbQS/oEkVwM4Reg8JnKBr7u3E8gdutiUAyOC1a
	 WzTlxcGuo50rBL6QLVJSgo+gr+wCo/Eo7CDfP6VUKO2yU5nbrA1A/2kc1LnUDVI00CRpV
	 5qJtPS9uP/qogWsPDex3jCKhBpsAsDCQeXu3v8EBYtiEEXVBE/UW44xRyOlV3+/bJ6fqp
	 3E7oZfjeXwQojHXvUL5kFKvEcOsk0fzlIe2YH3meG51A6Mogo/bpsqLeY6DyBiw7GpeD5
	 wU0Z3HcGHY4oQOOIldadJZ3wKbL74RbP9bHd7zNF3agtxTLfeTNsGaJN6utAetx0bXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRMIX9Fs;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEEF606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCEEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRMIX9Fs
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adf89523d8so2949661fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341831; x=1795946631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
        b=qRMIX9Fse1q9rgE+hsN3rqYn28MkIBOjp9Z1P3GlJ19eu6CSdU3bVhVg+riMplID2T
         MsrzKHjY9yAuyeunBzQ0iuNLRKSre/z6fBX1yifAL/HhgIR1cY7a6bt9IU9jrblmZdXa
         jTOAXe+Xnq+myUzRIx0cehqNFRZBS9Fkb7kZwuSaBLcWqUBuuO1oT45RdJlnhg4gPNvL
         V0PTHgEYpK7sTjiLPa9zpxf1e0v0EvE9zeQUrTaBOMPArIe7mIOJYYOPgcDvUtD5old+
         jv9fkGTv5TLsrGx3eXDM34K35gy7GFnlTJjfQwv4Rcv+Qw0dj2avsHWLDIMEuEMBEbhX
         eGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341831; x=1795946631;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
        b=GYRhwErXp3JByyGwZs+Ye3gbA/zn93saMxrXVxNJdfaiNg444gB2L0FU5345z39c9y
         rBULw4bUfE7VMNfULv9GvfXb5be85CXxDgyD5GF5rOaIG6s1EKmTPLNDiu73zb3MLusZ
         m85qIY2pMcNmQkyWefdYK9C5XzZE0R0z5eEKMwykrzzn5VA46HJxc5tg2O2WMv4/XqXJ
         /GCK664WTWwpugEmrDUI+0kYVoMlIXEOXlXqa2wGdzWkv1B2zecdwqG5MCTn2p5kNMGf
         49132ZWCkcEfFDkWdsjWfaaxdX1wHqHZNkZ78Po/IJlbNtcnkaS28jnOv0mgd4R6/xuj
         6r9Q==
X-Forwarded-Encrypted: i=1; AL+hErHPjWRkIklJAz9OXjjGTVltjXYrxK7WjEiDeeHDkkDwYPwIVae5TdkGMnLJ/2bBV3u7uv90sLKBqRedNgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GeyBYCLcID4iEnH37dHI3P14FjotUCFzqhg8o4HzG6TUUHvvf
	lsrzWozg1Vp4mgh5wpMtWDeXutGNgEKL/9TDjsMRrdTQRnTxib0xbSo3
X-Gm-Gg: AZFdTZd+aMyFnq3O0Am1pPMyoH8hB/M3Ml5SEtNKd/QwYi2hOSqvc7DiriM9M2Knprq
	BFw0CdEYHGN4KU9Xsdraj8PIsnx19CqJf9+/q+EDkMwyOdcu35T/cNjnnhDUghdY8d9sr3+EJlY
	z80e++ySFo93jfGq6wzVOvV80c/o2h5TJuiPVycRfHDwl94ZTYJZzJaPwyCPO5yAnq8/v6G0Jk0
	z8Ph82vGyncW0mvyJrdWolrkPEadcsU/DJ7rKRBRzxPdT9h7/b/9IvsGtx88Qmu7y5YuKL4F5Zm
	uccprvvbEyWjwSjWtNViM/LirB5+iRAU9fo9+FIsc5Gyoi3Kw+wDrnQlZuP10WtOFesJFSBuG3N
	DBgnLraqGOu4WP9nmWRdcCmTEkMZ5t97/cj85GBeYvLVP+pyNMW+Y9Fm6eK73JAfbf+ntRspP3a
	nr5BPryboQ2yBtJr4gPB+pcpZuOTNeBiP3yKACKMpZXOtooXvEqHtUfdVJDVZ7Sv9uVVTdEFlqp
	jd2mzHIh5/alysVoCTkyl5FXrQZII1SyLS4LzfZ1dbLxbX4EC7KTLa7e84gXJbAegbcOzKa7A3G
	s5qsKMWI7qrR7TC66rv0rIl018WePZx3YrWNaZLsy+qpa0xBHCCRilHU8SaWao8Q/3xKRGApIx8
	xIhq6S5dzk/DMcR2E6pl/ibSDvNA4be0pIbGgz9bf
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr2679661e87.2.1795341830712;
        Sun, 22 Nov 2026 02:03:50 -0800 (PST)
Received: from localhost ([178.150.68.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee97csm23390751fa.13.2026.11.22.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:03:49 -0800 (PST)
Date: Sun, 22 Nov 2026 12:03:48 +0200
From: Ivan Verbovoy <ivanverbovoy@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO controllers
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Message-ID: <20261122-swrm-mmio-irq-ping-f2926d22952d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vinod,

A gentle ping on this one. It fixes a regression from b27be5a85ed3,
which is in v7.4-rc1, so it would be good to have it in the fixes
for 7.4.

Thanks,
Ivan
