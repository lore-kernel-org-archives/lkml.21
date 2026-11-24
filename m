Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503632;
	b=2iICt8/MFvZWY0Tcydt+aBdCtzNq+lLJVFaJz2uS/twMONmnO46+UzsKlQVKTZ/E26Jo
	 VzV6j4LvPuZwXBKj/bFFH2+9PJBpThDXtJY5TbrjpoVZtJS/LY9SRa9gbWv7PPr3FMM6+
	 9qRfYFY83lHcWOU0Xyic6at3QmhJQdSytISvp9md3feP/CXt+L5sZwsuzeh2D6TZsdSFj
	 xkpNZSDxV0Yih53nd0ZFhi2URVMhFtPrGWzkWzHNIynHkiaOri6JMC7CRG0kBqyYWFLsm
	 Zvz5v+AFE0oYtW2EbuaQzaFw+9IM0yCRDUfWjalcGGeEcC3TxHdUvMnOpbcnywYb2/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
	b=Nuc+15VipohofLTrm2SQqlpB/nWJbxpYmSQiXwG88QA0RNK7BcpAIaubnIAeBHGiC6ly
	 2q722N40aX06rAm5IlCbqG9lW4w/eXEyUzujESXbKUJ6XOLd9KG739uyFPFrdjjxQBBfJ
	 AqgvVwG1GR3rXuqtkZlT+N18F/Xsbe147ELGTVh6WS3CYL4hcILjKJIc9VZ4oqUbhaTjb
	 kz5iU3L+2nwLDVqIOYjeWOSZ846G8PepUN7Vczv6wUDZxge8E3K5oGjNHWukVH0EkNBzv
	 KHwdAu0d8sdb8DBRQlFSAQEPXkjVAegyqHwHLzc8r1fqqgh9qO9+D+/qV0MP+LQ2fhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVGdd82U;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C309606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C309606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVGdd82U
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14a204305so2715521e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503630; x=1796108430; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=QVGdd82UruFfPdkhhDtfnYqoV6hQDoIc6LmdBLufjtmQpvNKfQQwYNlPT4YjkByGtC
         6b10N5ALfWr87MLq6fS42XMmf1oLMR0lG3tNc4la+6M161rsBCiPEePoiahvpmI08Q0Z
         aC53VISrmlWQvFm0CjvJHI1xPz0/R66Iz3+AvjcnKb1mVt0qOVT2+wIJk6LSYi4ate2X
         4S2MWMQVrYYIDvhFU0Kt9KID8whWfbFTA2VbauqgCBsy5/MTuy1exwBW+v/soVSc+irp
         EaLAxJqrZHrbGSaMGF5XpL87gVdKhgZTt3I1BMvo5spUCzG5KXRjOVvEysxZq4rlxvLm
         BBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503630; x=1796108430;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUUKY0RsjD+IVYyi5SJxAofkyIWwSJR0q+NQRX7ZwwU=;
        b=nOD6IbsxrTpmBY/GV9eriIuq4n8EzwgTZ9NYlYSeHzx047+lVen5pE2AXv+5MsBQTB
         2bycbOG1mvHI+4DpCRqvF1UtkxTSX/X/zVXpdF77mbTp8yDuXPsf9nwoWHC3cQ4qNgiv
         Qk5ScjIwnvBC4LVecdKXmZVn7sKRw55N/qZA6nvxP+rUYscic/o0opuafqO8DuokIYp6
         JjkkynIyjM2aeBRcfn942wAnI9jiZvkrXIrWKTbjzEYH1F6L7OIiE3yy5sNWhTKBP9x1
         xzydsTvzqZxWPcoNQDJbjN7DDAB+4OP3eUQsLRy1ntTxXKwbnB+Bc3Z0+44QvqHj7kSC
         iRwg==
X-Forwarded-Encrypted: i=1; AL+hErGAiMW+ddNzyPKElQC9WjtRJ+1AlEur9ufys+pzgJMF1xxipNxn6EcGcvVXfSz01EBFGOW7yMYW6AsUNas=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NCRU4AcIyJQlCXqzW0pDP5Xr/inqkWe61vDaHgJuwthHb48ia
	KxvWpnu2JivAsafoNeKjqxy2508sMkIdEzozyEcx9VHJWrv27cnZZwy5
X-Gm-Gg: AZFdTZcqgzp/bigg4t1shm8yVE2JWt4kPqwPiXVuiEZuFbqiayzQrvCrEUdqEhC3wfp
	5OZAtl0ozHxpptmmHNdPPcD/9QWnm9ywgw5wtRo+FNgv05Cd1yJ22HBD+2/BK0oxnir6HHeN5sB
	ZHA83IZmqkNLHzo+r0mCip6+FMJhKRDgxa9czt1xv4LHCXQHvsgnr305hN+ECf/OF8Fgflg+RxN
	hwmfNzP1dh7EGOEGVNIfFeiklUldIb/wfEU9vG6UisMRf4f/a/3sbuJ0oj0tH++2AvDXIsekpFK
	SWx5vKlRuLgvCuYwxURqOi+QjPwzy25Nxe0IHgEvVDyOBg2oQn+R1BEJpr2FDMsiiAYraM3Xn6t
	zIYNjDe+YCwGzQ67iyTO91z87n1/7xz0Lzxt+47VVFx4YLbRQ2uyAiCAtwVqTH7zKOHEkrLx/eo
	7Xj4b79TgFj4T3ScI179MaOFx202HExCHbLDqwcdHyKHxiQRf8Vk0dDZvpBJi1iUlgckvmh192E
	WJv0QwTiZROPTlg6549sYyg7Ck6YhEVn8Wb14ikxqwTTzzuSWkbgHi5PtaGT5P4bx8PiDBCrxvP
	JdMmfrD2YxJ6bmOilFOZSLHMD+U5GEjXnS+yhJyPOZK7HxHBvzqJ6Qc=
X-Received: by 2002:a05:6512:12c4:b0:5c1:563f:ff23 with SMTP id 2adb3069b0e04-5c1bc84ebc3mr3803268e87.61.1795503630067;
        Mon, 23 Nov 2026 23:00:30 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05e235sm3481118e87.64.2026.11.23.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/8] dt-bindings: clock: Describe CS7542 PCIe gates and resets
In-Reply-To: <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
References: <20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com>
 <20261123-b4-cs7542-pcie-v1-2-4cde5201d404@gmail.com>
 <831a6498-9c1a-4829-b47d-52035fe15444@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352887.5.18085137758862458863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Agreed. I have folded these controls into the parent global syscon in the
separately posted shared-global follow-up:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The parent node now provides both clocks and resets directly. The prepared
PCIe revision removes this resource-less child binding/provider and uses
the parent. I will let the ongoing reviews settle before reposting the
PCIe series.

Thanks,
Fil

