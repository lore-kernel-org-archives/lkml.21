Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475755;
	b=WxKH3nH4kWcF4onI+HHJic2E9lRDpAQ/B527aNn8FWsAdnsxz+cQgdMO3U1UJYJLTl9f
	 xHlVim51yplIwoELvVksB2e9o/q/jWzie1yHJU5/kDRYFUs1yoIMrbXlErGomNdWqdmdQ
	 bgyH9JbLVoGW8UM/mv4/YzFRbY8r7z3wfYFsZFjXG++uRZlHOrmDHm5UA3Ps1+SK2Es9U
	 8OHkDUiPn73hcHsGMNTKoqgtnhG99ccFCVQ7ctOdakwasea2HPujPQlhpGi9LK9U/xq+w
	 Y2n0tqRA9lASnkOfVO1uLIa+T1cT1eSOq9TYsIC2/l4wBrtAkT4nuHU5tPRF8umYnhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
	b=YnOK2YzWZwnjauzXkdtk0LqtgtJ+szCyCv5g/Q0fh5ub4gcI+dY6m7aiWCBctgzNSr+W
	 i6+9y7kquVwLx7J4SRvH1inrljxBYJGSzBO58jbF1YUhYRmkemEtazVGmQVKgUjP4EjyW
	 K6GNvTuWkHn5oXl7O5ACqAh3pvn3PO2qvG97XDVnmsdUIkbn2CtRVHWstW8bmk4ysUV24
	 gjEhQg5zCnNwa4FLdXDFo4DM7vr63bfib+SE7hKpxIxv7lLfVkM0C8637/4wLSKOcgpeY
	 qmm4M5g8uaxPojA6/rIyJwZYWTDUy5kSr2T455JU4SAIhinKcWyP3pmUUh8DzXCzEzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVV0trp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62B606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E62B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPVV0trp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so31319575e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475754; x=1796080554; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=wPVV0trpVGtHbB/97bjQWfk2GYqAhNe4E8Kv4EAegMEy9E7FLZuTqBdH1ZjCVch56k
         2vt1WbcahQHEbrkN2AofgMYByjZ9FZ7lQRs1JJ2us4wY3e2t+lne8Yn8U+OTSkhEvN2c
         DWPIo9V+4MCO594r/DqmBqXX6qPeHNVbl4uWNRS5lakbIJ7VahPHlvPCk5gurmHScvZo
         QzLCeW9PLmdvNUZIeC9WBXHwBfn3S4fiKQymdPRLhp2yiuSzbw243y6S3rTATicHq7/Z
         fGSUPFFfYHSt0BNmil0SceTSOBreYF9YF4VwIjsTMHL+LatSuJwxCtTdL7w1wtYrMWnH
         mY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475754; x=1796080554;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=Z49s3RD3jv0XK7iW1Aqgdqcfg5ER9365oqB2BhSPa4kXV/rlT7eE6pVRSJ+JnHXP8g
         zq1LsRkwn+G8C2YgQW4Mu55K4vfBRsytav6Hx0A4gAGJZ/GS34FoJHGpxdDqsspgcK9z
         h5KRl9jzw+b6vBMVJzKiVyXOcxx3x6M5Yu2QEN8HgVPavBVdd92aMKsJWc4CpxBOI6x6
         Hl8RHk3738FPlShovx33jO/n8Fda+PpTWnVvqUaOyn53jhnpuIV6sFJYemNdv8kMqmsJ
         NHKD7YPzuLMLQ1n+qPzozBEH5+f83b+zmgnl3bZ//PdW58wt8bS0UccvvEkO8gvCf+fg
         f+1Q==
X-Forwarded-Encrypted: i=1; AL+hErHP/RAow7C3aB0TGpb9CHiFRtLepe5+8pCRyBO5BlMALRfSWUr5I7sl1jLr72xDLfiW4QMuAqBVU/OaDjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ehBQdTg6C6U72pRBF7IINrkLXM8YVRwhhEFp8L4C+0rQhvpbh
	ns/4v7EM9jZvPzjEnURVIdmNY/XpwsAuyt66h0ZvuBv+fRC6Q7uNo9Qp
X-Gm-Gg: AZFdTZft4IZFcXalb2cuUBXXNlBnT9/fl1nwnBbiDu2NYvRUSo8DtR9QzNmzIWYAmgp
	tWduOCc27SdlAfB2s/NDueS5P/rG4B7spwB1E3n+LynNkog82DFtjIaeS8c2YRkqXHp8BlBKe20
	iSRLcpKtYYeOND9nUQHDUeYwd3m7jG/Ex0i3DMptiEhK+XSVHKakt1TAeStcwmG8HqQ6h/ijhmp
	Rt7rTEmSo32n+La9VirA8oDI6QyHgZ9nDGVmDw3cyyZbTn9+sBoLNlx0vuN6PribCG5rxj6VxtI
	6/HKC+IeZOZgI6NZKqr7RoK3hvDfJ9iV24zMcSqQvw2u4HEZifUygBMQzBsds8zgj9KOB871ebc
	Skn75E8S/4zTJVSEhAGvN+yPMcn3+fUgQT6p7E8/uARYeQ+600+S2HTYs+5XhWe6nRTrSrZyP64
	u9ta9LU/XYBo4FGcYgxnRntTJ27fgC43goKf1DD5134hCLprmQmZ9ks+wtSI0Mpgqz3IEEab88S
	vJKpBl1C/L+N3jaeRFw0sX9ELiGSN8RG5AUsl5OGEsGmFgNlasPtp+7N6YNYnIHL9CHMGOrdlKG
	/cht+yh8an96HMhQy9XZx+Rjyf++ZK+hM34qTTwba43kc5nliLfq36k=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr269607585e9.24.1795475753577;
        Mon, 23 Nov 2026 15:15:53 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm214620235e9.1.2026.11.23.15.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:15:52 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] soc: cortina: Add CS7542 PCIe control, SerDes and
  host support
Date: Mon, 23 Nov 2026 23:15:46 +0000
Message-ID: <179547574633.3.10816077515932240445@gmail.com>
In-Reply-To: <20261123225447.GA1119216@bhelgaas>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123225447.GA1119216@bhelgaas>
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

Understood, sorry for the rapid reroll. I will wait a few days between
PCIe revisions and collect the review before sending the next version.
I will use the meantime to address your comments and test the changes
on Almond+.

Thanks,
Fil
