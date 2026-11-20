Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186794;
	b=y5iioE5RH2NTe+qw4bbd5LQLwmVQYYqsR3gjlY6Cnu75T2RVjDRBUdNVVmvmeYrm+d9p
	 2sTTpeI0DP790EVIHxjmXutxb/WETfm6saU0btPdqbTR6OEFngHGtQ33X42M7IYNr25AW
	 FldJXJEz2p7FuMqhZnY2StMjipNG+V+wDFUFOvCs15gjR1VZqiea49JgdoQjiU3RMXB17
	 24KLe635WTkAcLBM0gHvRr3ST2IsKxOqNrmetkqUFMKaGaujTe1NsbJYL91j2wu8bCXMh
	 RQGxWL7AyLc0/GADZ2ZC4DFPZdIiETML1ceRy9SIMHx1U7ycGLKNBFoOBZT6b+iqyKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0QNzEFV3vJuOGSdQIc+xIG1ijvSXzUStwoNbAGUQa7M=;
	b=ANjbrvt3d+cA/jIwayxw7U9JVh/C1z0o7vjK7LK3plXGMj0RDIuolIdQifqcuIVdMPKq
	 iFUtd/HJuISlbjo57R2LOAvD9iNILIDpTHLeGqr2B6yrtOmkeI/atVbdJFbBJahrgyg8A
	 7wzJYeA9XmR1w2KmWQ1WDeH+D/SS7U81huqJUWh/Jq6bUn2kxjpo8bSoY4TNittt/99IF
	 8HOXO9LhrLgckKJB0xepm32XdIxm9mD3WO5tbcvThLNXiBusQxMvNJExTNcVV+fyM2/W2
	 iKPTVat0YTMTPES9lFbcnSAYuQ+WrKPtfln9qmOzCBbhIrFi88juIRm8pxUWtzhVU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bGsyoFaS;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B060A263B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947B060A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bGsyoFaS
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04ad2c46dso3186295ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186794; x=1795791594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QNzEFV3vJuOGSdQIc+xIG1ijvSXzUStwoNbAGUQa7M=;
        b=bGsyoFaSVaBZVgDaFpzOnIwmXTxgBFvAReHHWvc9lTDMQis0wqm1hIViGKLxZg0FQk
         q4IdpWBnCrXp86wYpSI+SnKqMYCACzuEmnfSazX5dMTNRoBP0CHs2ObP33UJKJ1Rp33H
         9wbswJ9vm/kczSVX7VWM5KuAk1BQkN/gWzgIFTX4fhQqcgrOayZ/l8vStulch/J8ouFd
         yahloIvyuIjEWUTDa2sKeUfMV3fOupaxbbr9jP1DVZgxwKHtmEr3Y2i8iI1//nTzwc92
         tq9nYwhSJj0cKje1kF78acEQZhdBaH1i+eOaVenIvhetaDqp0RJ0TOlaBbM6CzUVNiGz
         JfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186794; x=1795791594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QNzEFV3vJuOGSdQIc+xIG1ijvSXzUStwoNbAGUQa7M=;
        b=XgPZKt3yXChJ3s1LUkc10pJ/jupjLGOd4WgDysQD8nZo0I5qqjoKZfFjpNxtZv4AOs
         rX/6EN43YmpUL9+62d/vaVaCcsmuOlBQN/TZ34+eO3FB44mY+EYojMSfdR7ZC2dLjksv
         pfZBgvt6OEJdb78coG9WJ3ybJhmm16vmNOeJtoCxRY59BSKYePaDiuqU6aKyqQQgzJG9
         a/y3JU+IIp+kQC593Sv06lnVYH7HECqMB8qwnR5nz1n2jfsrTpgcouZEM7VF8dd53f/l
         xfoErRz+4wOGFjBWsFjLAzCIZc5xWSNNv/Hu1YP2d40Brx2NZxWeJH2qSuBTn5D4JA+q
         FPrw==
X-Forwarded-Encrypted: i=1; AL+hErHz/JcqYj8fYtmKUMM39KaJ5LojJ24Dv1N9mLylbMdtlRs2/ZV9U/3BfUamKo67FZC8B9fTh+Fkp7C4GTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W31cjFuxsaKc1ZYTfmzsiumP28AXAkx2e+ERgqT5WoClGJnOp
	yxMwaDYKwGbvsWG/HfuefiA5MOHsCAgU4eSEfjC2fYvFLj1POx7LJHihSFp2egapLEE=
X-Gm-Gg: AZFdTZd5e4BXGcSKG9YT4NnAfzI6VaXvtq57wU6LSw8VIvJTd5r2jDDBnr9cXaP+5ju
	RSuw8G7IaNUiVQCrF9eBxOc5zeVDpUvS45KtA0JUP80Y8SLy0tJuM+7DpZNHUnh0CS4r2yGORxz
	2b58tbM3NmQi6u2vzihE3/8LS8EsAg0r4gEFpfJU/tVAAIQZEa940gLbEX3qrSUGOKvOvEDoSI0
	OiWpeqFnX6eRROLfSqEKSIh9Iywy7BjrBO65vlDqsleXrfumG0o/l5mEOIWCTrAGW6pp4lCev9L
	amKn0wzewCtWk/vJQrNJtA14fVoRvtixxdIaRi0ItbEAFDQcD2WzvZbzlg11xWpEYseqheh1ZQY
	ZnmLZZAv6ANSzWd9IKeeX9xkVgWyNOBPLQuTBb4bb/kSMYkvqafAgRfie2Kpwz6G3LxOqLDLSCm
	Q9HLHkLYe68Ot+YFdi6uoGdyXOfIrPTK20vNn/Y2fgbEWCswW1Hbm0tyFfFButSxG5bRJdRd7Pr
	7Wjt/+/bP0HfvD/JTKUEMrrHHIZUlAeSf31tLY2jUXWrx6PoJTf0ZPwQAFjqVNLQfMjSSlZ7yky
	QOME4ex14V1KBGI1hOjqJfhF7gWo+UdJfk851GhYT+8ZgtSYYyk1UOuhEaew8ImDk1Jv85uM5oi
	3Lc8ycoBmMc/ID68ZeLC3h9Nbp7ynDXvTZRTT
X-Received: by 2002:a17:902:e847:b0:2f0:2c63:8bff with SMTP id d9443c01a7336-2f03f1c0088mr38054055ad.39.1795186793943;
        Fri, 20 Nov 2026 06:59:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm15587795ad.75.2026.11.20.06.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: justin.tee@broadcom.com
Cc: hch@lst.de,
	sagi@grimberg.me,
	kbusch@kernel.org,
	linux-nvme@lists.infradead.org,
	nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com,
	kch@nvidia.com,
	jsmart2021@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-fc: bound the FCP command data length before allocating buffers
Date: Fri, 20 Nov 2026 23:59:47 +0900
Message-ID: <20261120145947.3127969-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104038.3078601-1-yhlee@isslab.korea.ac.kr>
References: <20261013104038.3078601-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 07:40:38PM +0900, Yehyeong Lee wrote:
> nvmet_fc_handle_fcp_rqst() takes the data length straight from the FCP
> command IU (cmdiu->data_len, a 32-bit value from the wire) into
> fod->req.transfer_len and calls nvmet_fc_alloc_tgt_pgs(), which hands it to
> sgl_alloc() with no upper bound.  nvmet_req_init() only parses the command
> and clears transfer_len; nvmet_check_transfer_len(), the only other place
> the length is checked, runs later from req->execute(), after the allocation

This is superseded by v2:
  https://lore.kernel.org/all/20261013153316.3178656-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
