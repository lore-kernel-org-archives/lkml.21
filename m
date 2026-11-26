Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692179;
	b=RS5pQPXbG5UL4XKf8UYgkDHpJmwVq2uP2vmAaUropMctJuN8seBUctOb3dYygV1VZKFE
	 rbMdgnGtqyQH6y349ZFwAHbzKdJaDm+XkNm3CEEJZ0tIqCNU5Z8UB6JD3YXuzl6lO83nk
	 LCVeWZozgCLIDuYtx18oeGpfIK1wQM7eCYsW0uZPQjP7UsAcCpavJRt36jMG6DwalhVMH
	 n+iFOteutkAEzjGwdLHknGyIuD6g2Q83aSEZjtHBlig40bPH6QrQ5Js4Lu7jt3mmcTEup
	 3FdUCbPrlRd7ZUzonn9Xdf2sODTF/HsDFzPP+ZAR24fipJ41BUyr22HfCWl9h9D569Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
	b=UG3kjdDLz2z3Gmnm/nMxba08XqgOtSukI4GKNxXJA1A42ljTEDroaKHCTcja8QftG5aQ
	 SJYxgaAjIkW9vVpM0cOxNdYqwrRW5AR4a7h1xS6ms6lJ4QN9IPcJaXVSu1/st0R2+rKoa
	 SpZv6KQK/c92YBv6ERfzmAKnyWVmtCBdIRKqyDKHGfM0BGNEjrCJ6s6py7Ymu6gy1Fi40
	 qMyP/LHZ4mLQsU8vGNMkySJbaTzW/fRgIiFQzQPTx+fC877RxT/zQxyIlC99pXdUhB9tJ
	 8l9gQMavWYykIBQFy2x4QNtvjlbUxL30LdihvNTC4qMHBZ5dLKjXn/CPBY7alEhIXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rUM4Q+6I;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541B606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0541B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rUM4Q+6I
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4557182eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795692178; x=1796296978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
        b=rUM4Q+6I3/M0io47xi6FkZ4+3QYkLQ+dBxio8MpItCE+cJEueofYt9thzNDnENUtX3
         fe/MgHaw8oRThq9AG98M2yH11d1vS17MQTqBhYIoQJGftHX6l51KsvaOKKCODdnCkfXY
         YzgZAkpmuMro383aEeRzjVbBh2lygiZ5Mhv1b0GeO1QX2QClt3n3Feb54HMaAa1AzTxM
         GGkJJdaoObMKMAa28MfXNdNCSXn69Gz4pqMRLqTcfseWxqas5NE+v+tZpCP/BBIncPwe
         OqZ7PUcX0lnhQ7q4i8+4AqrpnuQM/T+BrL8NwtuOmoJWoCthnmzBDTZcTTGG6dbPUbOR
         vcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692178; x=1796296978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2aTJR5ujlY1iuig4Lvg9F+LskDwvfVaLLYuQpm8ut8=;
        b=kcQn63fdPeaaG1C3uUboE1zTskairW+w7+li9Qzduw0MY4WIbAcJ8Y5ueEPtvmyhOR
         VNqgGtSvHcAf5J4g2iBpQr67WwIyfuDOkzeTpcK5hrWxoE/T/fae72oOtPdDFDnW29Nx
         NfWm4sOAQjgPzfmOesXsBa7AkLoe02XXmuOALt16PQDteAsG5IyraglFb1UOSdT8jZ9x
         ZNO0RFORCLp84aplDKQH2hKvrzggdqsLxvlvGjYyfj8S5njSeXP5R2x3R/z62lvPoXA/
         M8Txz8ZrFpx9hFn9nkoOBEDjyQxF/cgwDxIjgQRMQ1i9C2ytTNXw4Oq6+CKDcrpTk0nm
         VE/A==
X-Forwarded-Encrypted: i=1; AL+hErFfRhEKhWC7cK2/Aq50LKEo25+NkhmKqd/TtpXIfpKe+wKsVU8nQNI5GlZH/qIEpLp6EBe+Fa8OCX9/hEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kPhwMurpSCMQmwXSdXu6A+w8YwgT7iFDh+IEmtlL/ApDEiJLJ
	QGqErg7xR4v3vIm8t0Ff5pJBOHgFVsZAn4LqBYLiymF82fpow9d1Yevl9oy4xtF9Qw==
X-Gm-Gg: AZFdTZdH5eEkvV5rHY1FMTGZFOVHuyBwIEfmpGbSSWlIh6SFVAYJOhCy/wZUPVbGqvi
	X0TOhM67R1tt1YB4iYrJS2NXAju8CYEF/JYSWPjEasqM0zUWCip47j1+CpTBWTF+7GbpOfciKGi
	xm/AhIhKRt+/X5kO/Ik7eVU75t6M36PIHb5NDFqd3pqsOpmZFr03LriVSIhX/HjzjSUmICKYHtc
	5I6LpyJivAK2DdyJ7WpoiMlY5KLjPyDDGRBWHHm1JFjGIpnLNH5cldfUVxdT0lvsjl2CTvmwy/Z
	1xLr01TohWdzY9oThJ5sgjKY+VlSur2w8Yp2M3ErRgKe5Iqe503k/AolwYbHU9r7BoSqa4y6WCI
	xcUEPQBIIK2hjMnUpmNHwDjsSubMcksGcBPz4I6E+3gmu4ycodjprGjiI92/NZbA2Ufx+kQ9o6g
	YwQmw/vOYgG7/czVSbrQ+26Jg20ATPKAbblD2deCXONtSXc9TVFpSUm4SPV0evlXwOWsJBeXOib
	x3ENqGwG/bBDi9KzWgU5A4oeKHTJ9ihPHX1/jcANW7Autd/9V1lRTCWWnH5vWNr3Xlb4h2xLNqQ
	YuvnqZQyvZcoBF4X41+kYlVvaATifoc9AecmPXDXPEIhZlhpbw5IKw0dFTEcRDGoatglEXkQYUI
	/pNHdbsrgmG/wzPR01g==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr11103689eec.21.1795692177950;
        Thu, 26 Nov 2026 03:22:57 -0800 (PST)
Received: from cantal.lan ([58.136.75.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm70620666eec.26.2026.11.26.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:22:57 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mahesh Rao <mahesh.rao@altera.com>,
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
Date: Thu, 26 Nov 2026 18:22:53 +0700
Message-ID: <20261126112253.365806-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
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

Tested on a DE25-Nano on v7.4-rc4 with socfpga for-next: boot from
microSD, Ethernet, the HPS LED, I2C1 with the LIS2DW12, and the service
layer interrupt (hwmon readings).

Tested-by: James Clark <jjc@jclark.com>
