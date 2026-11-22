Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381996;
	b=cFsm53y9+Fl+QApzHrBnHzQfs9CUr2i56Da9/hoxCRgjHyZWtgzvT7TygSC2fIYilQN+
	 bU60ZrPKBjtgLpR+7yHpLFZVmF2yotLjJNgUG6uHyqT1tD7ha12KscVnQUEHx5ZGD+Gnj
	 ILJF5nMTDiImclBUcDkOPYL7ZeOCtdcPFmpOLXsU3lp4oCOQHSQnuQOlIWB2dMlxKym1R
	 6DXSy86cgAbfdptKcPiG6kApHPjOkGD2KhSu+xWuvdJiqRCOtHVv8UXxq/Xb4NpCe7yc+
	 Yn9puA7oo7YNYPMjAKNKqsLbfVVti5gAZ2Pt/GhqlwLkZ/mPoDF3bYJxsFI8JkDDLHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
	b=l3m2nYVgVK6zX1VMj2O3aICPNZjKPMl1x4aFnvzKIXMQNi0Hun1jnd/UqbhSsSZlEN5c
	 vZuGg0JWae4tX5INQC0K7tJq2xaEMUR22Lir55h6p4JM+OLtfP4qxKpvABKf1AUXcS9nX
	 VUAdFtgMTLKqt7YhV1newBKA1Z6Rmx0Ar2J6FNvcToldbMWk0Y67T0aPh3pXwVgbZk/Q1
	 EUAEnvkdW0GZ+T7KwlNx7IC6KUvRmIu2SSEfh4PW3H86DmAjCYx40vzMyNs1GfVrmostz
	 NbXb1R6Zg445aDJhirdmRmAZGibm7xOI/7B2pEOEaoe4Z7XFij2MchAEhaHjfMu8sTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hyoEPemf;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C120606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C120606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hyoEPemf
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so648475a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381994; x=1795986794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
        b=hyoEPemfLzhtTLhIa0+BnYLQasi653Aeqcex26eZEtEAp4XpEg38aA4qQIDG4nQAOY
         YM+ohOHl1gYtdTDffqfXmNIJ01AO3MGfhcPGVtuEoUOBOHmPQisGgUNLWOs/uAoI5n2P
         OLeHtDFG6PgdsgdtuvS0Vlr+ALRh/8VtMcDXbyobL38ssMzkLr0+NPxvpWAJIXHd/4rI
         oKCh7w9Vd4HwoSO6vgOdBkM3SaAg7vlKlaAHIUayOozRgQcmlmsVIKbbNafYF3uaA0Va
         SSSoqLLYL6M6wKOUzeAqMtFxKhQHXSAEDU5oLsbIrZc2Nc0gYGN1v4yjdCtPixoW9zWH
         vvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381994; x=1795986794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u79eAm9SL7rzpcixzShk17KsyWw74s1ML6HOCwCaJA=;
        b=Ts4wJW45ahPyroKLrq/zAkPOv93/d7uahWnyJjiiM+XfelcAqf6kSx049vBIlGVAZl
         nb+/mnAl32raBN6Y2QSxu1+h9VaH+q6z3CWBsj+gZTlyFF+vmGKAKq7R/HZdXOgFTPih
         g/nH8CRcK60zb1VC5SB3tWcbUMXuSZzMRU/d4SaMuZM6EkNdHXFy9hr0FoJmGtFL0a73
         3nJWplGs/Exq39ZryWXdszKtfw3Fd0SzbsLEXj0gJS5U2TcytMgV4G40az4lE4pgAPIN
         H2FrhkwXw4/WADw7CdoeDgBx4g8O5aMsdmGhnQFbILZ1P8IanNLOASCSs6hWWTZUAkqZ
         E/oA==
X-Forwarded-Encrypted: i=1; AL+hErHPnfTSifAmSXGrgAqh+vDSTiCV4TQHYnqZlUqCs/5s4hCKNeNzxCxuVpW6C8jxrxw4KNomQ7OoTLPclYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vu8/VNoeFHCquZbcnPnnxqLzDU5mBD00O6/fz7TggKVteKRHE
	a8k183/Cbn+8Z7byFfAiaJeXPp+NUwIQWZy+O9k9sHg+cKnfq9Y3oEIaEGJQGKRTog==
X-Gm-Gg: AZFdTZeovfaoeuhTiHrVJBazXyUE30tkQTUlwjZ+bfTcFsP3Xc+n7szKnIItu6mMrBy
	+ZwhzPV+xYPhkwAJkFxTy2jSLFltqAjVpFQOo2BYB7+wq9qXfeyvwcKHDj3OD8tuq4KweMrLJwd
	lQIOJ+YxQ7yORcEajV6hMNslA05PYNr13hz+k0+Z5GAVS2mfUcvDnz6aaw0mM6mRAg6o90EbZ1B
	Frt6DLmSTHwa0SfDWf4LMf0gjOAYbv36aF8zIvbRHnt+nBNF/tdAuoioFcIxUnfXRMxmNa3KKQ+
	qdM5huQeunE1DC3kXwe42yuE2eCIORNcvbka5FtR1M2/clA1NKCQCqTcgC7bNUDkA5AMLfS9AQZ
	4sH9lCjwDXT4Cxqt3B7alf1c1gom43ZTuTtix7r01bK4PkPV4SlTKzlhqSPAsJmRKiOTnQhEGiv
	ufetPfrRWC7smZMASbJKgKLdsTj4AU6+ek9HqNDIbN6YfolfWIvSv9SxHxRv+Fys2RvoQ1ZdWNG
	HPCjnOgLooc0iCA33rgHqDbEVvibWmjZBkbJ2QFJLpsfO6SVyYGfUjhjXDC4fZlF3Oc5+7iSPSZ
	hxMs/olY5QOaeECKMoh7IOWTGOv8unPGLtzagikPQTw685qb5lClfqmRsMuDwOuhjByHqEvB6bg
	LrFfOGS8c9fhlS/+sf7Nn1PaJ8CaLIgkwVVOP6WQ+l9z0j+3npl6lGDx4uvpnHKvyLvahvxXqGe
	B35v+wj/wU0A8XbYV1MzDwHA5SN8K5j3mSNcjgBZ0zikiV2i51z4Ag2j5ZDczCqZRw96lJhye4f
	t120Fk6k2JS5GXhZFz4krUMXvSRBKY1O0WNAAgH9xaul5tfujZN8kkr9v9sZafb/dzfEoS1KwSb
	6zhcSt2u8hyuXBgzzCy4DZjkyGKR9xOYXW2/ev89ZaNMEIJrQ286nYLVcps5Wfz1BdsUuKhnhg=
	=
X-Received: by 2002:aa7:da58:0:b0:6b8:6d68:23dc with SMTP id 4fb4d7f45d1cf-6ba37d51f47mr4295989a12.7.1795381994095;
        Sun, 22 Nov 2026 13:13:14 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d50069697652bafd0866.dip0.t-ipconnect.de. [2003:f2:4713:d500:6969:7652:bafd:866])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm4245663a12.32.2026.11.22.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:13:13 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	john@phrozen.org,
	kvalo@kernel.org,
	nico.escande@gmail.com
Subject: Re: [PATCH ath-next] wifi: ath11k: report TX retries in station statistics
Date: Sun, 22 Nov 2026 22:13:14 +0100
Message-ID: <20261122211314.2143272-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018171803.1545946-1-julius@bairaktaris.de>
References: <20261018171803.1545946-1-julius@bairaktaris.de>
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

On Sun, Oct 18, 2026 at 07:18:03PM +0200, Julius Bairaktaris wrote:
> ath11k does not fill NL80211_STA_INFO_TX_RETRIES, and mac80211's TX
> status accounting leaves it at zero because the driver reports no
> per-rate try counts.

Jeff, the patch still applies to ath-next 1983b40acfcb. Is anything
missing before it can be taken?

Julius
