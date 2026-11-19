Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058930;
	b=KHABZyQtaXlUx14iD/0uIsJnxhnkL5+zPW1/1llK6xNrY1iu+3Kn3rih0AJ4+stJiQz2
	 fhwbW2D8W3vV6KFtbfoCxLlKwX43+g4bFzRPbJAn7v/pSqNbBR/kMY3apnayX5ighZK8p
	 BCysD5USbVTnwPCUV6SVgAKTAdwE3b/34QlIrOZqNO5p8qK7hvxCamQ6NKmIvswAseXft
	 rxbDfPRaWe93rCqVIAMALF55qgVYp6iaxf9eYlj5NVeb56nWYvPTTkWw7paAKh3U86IKT
	 2C/F4emhK4d/eGvdZxdGoeQNGzIfwqXggkXlYVVqFHU/YGRifYbVmj/J8dwZZnAc1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CYlgoWlQjoEhGqZTHu9yMtGAoHutdZN/vbViahm757M=;
	b=nEd+3ruvYApxC6mCH0dXQOYyzW5aMJUgyWkSRMvqDAARa4gDbvGTacRL+gecoO3X/I2E
	 7rkS5BDthudPI47gxEgcykI/9PBABwZ54dxm3W9CuLYu2ZOWVAQPYWN5rwRQ8lsTHMYT3
	 JBplBasMIhnhOyl4WpxrJd5wWdYP+VzAynC/gtaf2nExB1GiNRnKW+lznpVImtiSXFH88
	 NjLcy0XPza012BZsPkxPSAg6N3zH8IoS59bYCOmzijqWhEmT8VjUnbG4SWXZJv5OPZbRN
	 DTSwg18h9CbbO+csETdTFUos2qGDWjhgKHqUpyhjm1nREk+7dP3SbsOG71J+jboVBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXfCUbWL;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EB606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F0EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXfCUbWL
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so344761a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795058930; x=1795663730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYlgoWlQjoEhGqZTHu9yMtGAoHutdZN/vbViahm757M=;
        b=pXfCUbWLnxs76b/MfQ8RKnylzDz7BaKSoLAaNcVZVMp953cz1o5DWBgqMUqrMA5yIe
         F0UIBUgtJhZnSrfhRc18S6FvTkI3jq+cwTs98vwytkqQiKzFMdic4cKdjXY9PkmjqT6P
         /isOEoBUk6GSkGLO2jwxL3fumT6AWaEYB2yFtH+9VmokuBRVJw9wK6gfSQA95Y6YyEi2
         lt3Mpo/45zTNEnR6QccgMGVVZi34CU9IlSiBO6PmjuWmgr77sGAaGcwS1hIkR3XqXelH
         ANFDsSg6Tl6F6ORfTI4Vv6h4ZjSYGXGR8jxrw7KEjOSI6EW6enHkwxFiEeuuTZ1oUoeC
         sLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058930; x=1795663730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYlgoWlQjoEhGqZTHu9yMtGAoHutdZN/vbViahm757M=;
        b=x6sDqd6ySzeYzPKCf5b/X2FhyJ/iqxpSK3WB1wGPiTRjdjpQi5S8I5T0lNaEO27TGk
         fycQUpTyg3prkz9wNUAG2pHw1lNswJEqAKjV8HRmmNBTB3nlAB1veXepDF+uUkiEmP6D
         d1NYnjZ1jGe0sd5GKa2j79S7mkfSS6z9/cNQ5dzCXbvdt46oUl/ed/BOTG0+JYIp+wRu
         djRV/CsOmZ8vYpwpk4no15IcV8AHU9x36TK7Q5xjDxK4LYlg5R5dG5g9AD3Xwb53XGUy
         kzhb9y+pvXPxYE6JkXM6YRnfl2HVTMkljNS9LZ/sA1hdSkP/eTcqOqXXNgkUtZkXnmcQ
         klTw==
X-Forwarded-Encrypted: i=1; AL+hErHM2U6g1660oKe22MkBlDPvk8XN2tQVQ7wnb+udh96DV8ivqeIVUx0D0iKDbP0rEWySRJNK3WHAOZaQtIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OwiMeJMWMcd2slrjpUNwi+uND9LXa+pJT2DM1gfjyplcXBxqX
	hzwlc5eBx7iajeOStCaq+TR1qoj7Ql7AtNMV3I51bO3u3xtn/eBV+uAJ
X-Gm-Gg: AZFdTZcFg5tcaTRFLT+pUqjIxfJHGJwDR14OF9YeZ2wjrzr3hfe4UlhydagOxgze3vB
	5kZVNjbClXrNMKtR7OpuLcrvWVoc+OhP8jXiACTPbaGOsFUHiwXyLmdKNoiZfABzi3wbUFave6o
	UhVuhFE+4JYY8WcqA3gtgjHWN+mChOb3pik9YZfcY4Xv4k/RT/Jl8wHEh/5c7v4a/GnHg6sbsXU
	iCo18ZAAeq4IdsxLYf8C7rpLNLRVhbFiZdjLt+mahIUUL+/3ohqwRPv4mb5t0T9WCtGRI+UFsH0
	BhDeZhC2dttv/VbYQIWx6DHAszqEq82ZtEr3DmGYspvILhT95591N22ucwB3LjYB08Z4XAlcqgP
	R6IHnAXzkLX7OA2UBE5qARjDrhnYqW15CDCV54Ed2d8s56VRYqRF4b3Z88XMrEW96myEj1CB3uI
	bH8gRr6+up4m4sfpK/L4HSHAobgRVF80h4IAWm5cbg2gWB60XGnZcdD954P4WvVI+7qvgQyNJ9K
	VGnBirLSgynHcrLnD0PGY5dOKjU9wuMaOtelB1FQpCaXPB4US20TcNKF49HIFzDVuFXBPFKkAVL
	5NdAFwxt8tyztMEOtf1LCa8Jgp+veuncyh5jpkJO6EUpDijAYQ==
X-Received: by 2002:a17:90b:2487:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b3ffa1d30fmr268271a91.17.1795058929793;
        Wed, 18 Nov 2026 19:28:49 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402aa8555sm319488a91.3.2026.11.18.19.28.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 19:28:49 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fs: ignore RLIMIT_FSIZE above LLONG_MAX in generic_write_check_limits()
Date: Thu, 19 Nov 2026 11:28:42 +0800
Message-ID: <20261119032842.34297-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119031026.7985-2-dingf3ng@gmail.com>
References: <20261119031026.7985-2-dingf3ng@gmail.com>
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

Jan reviewed v1 of this patch after I had prepared v2:

https://lore.kernel.org/linux-fsdevel/hwwtflqzbga65oxvo7bw44xuhpbqseyfww62kyzko5az4gdnxy@4wxsl465nvp5/

The only change in v2 is the type of the limit (u64 instead of
unsigned long).

Thanks,
Ding Feng
