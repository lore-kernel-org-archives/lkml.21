Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542253;
	b=hF3zODeU7Hgor/xvaLGpzcFaYnlcrUzMNJ5XS/fG4gg6eojjF382jFAk5nRYAcYOSgLV
	 KCow4ttmoX7oRDD1KCLdYTtQUhvvBFRWQpVfhfDtsvodiFjBLjpRRw3x19887xugB48RO
	 yxu4e6/+MqUbr6qxO+13H7tZGU9RNh4tYQovUyugBOLw2RSpsRRxbWoCfarqHuNWzzur+
	 XugM5I8dkEXWtBdYNodMyGajQiT4SJh9+ifm6Ng/l/Oeysk+EEgokc6sjfiaIF+snNON3
	 AcvN2yqQZzjJTv2iaXgWI554wJDQI4vptn1JWyrlF1vUBGpZ0BakFrgNXFAIBpFssXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
	b=kog6u0Ibgr7oVTIMRAsqCMqAbmMUOd0JzkWyXDjDCJ/NovNF8GmquhKJqbvXFd+8MtHf
	 zm5gexSlDiOntIe811YEsyBYTtlKFQ+TuBn6zCXI+3Ph3P90vMnrWcQFtaITC7tx3RvjH
	 V1UBUvWdvEKTSO45Ayik0bvuX57K4lsylWQP5EsLb9XHzJA5oJAB91BogChsu46M3mp9/
	 1D339z971VeG5JFzIEIHe131+SFY49Qmmw+BHpegs4nOeq6D3gst7kFL2gkmjHBnOF1O0
	 06lSeKxN2C6j+pAZKjvnLtko56rzd3oQc1vi8Q7juDEYJ1S5XA7K2sUG6yO4tDIMV8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UiYvQjLv;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14690606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14690606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UiYvQjLv
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so5863444a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542252; x=1796147052; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
        b=UiYvQjLvg/dD1tCSWefP5QrPsFFRp5iXlT+nm9Mnl8uNBuRz5H7ahG6sNLFLOLMjgs
         ptpXWJdaq11jXMjwjGk73Pz1VBPIsypaPmqPZGuxttol6VaIKGiCCOKHYpxZ3chuCCDL
         xk/tgdYCH/6c0E5sTqI+YSzXAeUdTJikqEa5MiorGNaG7b1dH5U1Par6WamULKijHjn0
         zoDQC67gSRjBA9yBw6fb1vj0t2pLmkFnM+xRzrCsjVucuclm8xgK3TeKnhe2JN8xhi7X
         dShYp1xCRmS4dSTjLqobvWeiDh9VRsKVoHblGcTn/BC7AplTPLU9IObhuI14/chIdbRD
         TUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542252; x=1796147052;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
        b=kCLzm/Vn6UvRQugjWRN9qvSwOu0CJYxMZS6q4tnJ18u/kas+t1WBUxxP1F0H5b2emE
         tqtYrhx3Pn2wtNQKlGhxLT7MJgqw0IAszOxlxVpbxFjB4YbQozz2gSTdHR+h6OPE/cE8
         JSUA3AQ+LI3yZwDa0nsIxoD4tQ6v9qK1ptQi7uMlsd9l4sJ2O43mnxuAik8EZNHkmbyB
         vDQdoub5xg4hAvJDYyMyy287t52f8SKlJQCPhJsAGKe0Ipj17zU2hZ8KsuKVqwUHccHP
         aVYxfzDoY4k6wAHSaOclUeBQQXzFES0m91+/vbp5Ks6ESOG2DHmu+14kffy8Y7nX4aBx
         xtSg==
X-Forwarded-Encrypted: i=1; AL+hErHNbGCDPNoqcuof9j9oUxcDlrUKuPI+LZ8oaBcl4kMa+RZHntAKCg396I/q4QWCkSbf+h4sc8ZmlVOd3EE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o3Pszjv/Yw0Ht3Z6nJE6Rk0w982udROqIKQ57C1QtvhelV7xN
	U1LayJkZtL2T+2Owpf6Vf1HVti+0+qCvABRdsJRVsOvDAmzXjTxNMOcyO0P0+zi/Y57DOXpAK2z
	aUjx4kHuKLuOPzT2Tbymf++s2cgW88Yei1Q==
X-Received: from pjbci6.prod.google.com ([2002:a17:90a:fc86:b0:3ae:c401:753])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr14294021a91.33.1795542252059;
 Tue, 24 Nov 2026 09:44:12 -0800 (PST)
Date: Tue, 24 Nov 2026 17:44:10 +0000
In-Reply-To: <20261110002437.2376944-1-rathodpriyank@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com> <20261110002437.2376944-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124174411.4183038-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn, Ilpo, Lukas,

Gentle ping on this series.

Note that since pci_force_enable_link_state() and the bitmask return
value of pcie_aspm_enabled() were deferred before v7.4-rc1, v7 as posted
no longer compiles on current pci/next (and has a minor Kconfig context
conflict after PCIE_EDR).

I have rebased the series locally onto pci/next, resolved the Kconfig
conflict, and replaced those deferred ASPM calls with a small
PCI-internal, reference-counted pcie_aspm_inhibit() helper in
drivers/pci/pcie/aspm.c (leaving include/linux/pci.h, pci.c, and
pci-driver.c untouched, and preserving existing ASPM/L1SS/Clock PM
state across sessions).

Would you like me to post the rebased v8 series now, or hold until any
broader ASPM API rework settles?

Thanks,
Priyank
