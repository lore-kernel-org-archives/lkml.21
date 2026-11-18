Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043613;
	b=BnFTxhthszb/iIVVxF2OKk2FjJYg0e2xNvtn4LBc464fmXS1klLcyPiGyo9wEDef4u5d
	 hA/Nc3o7zRXo3QGpKiq7LfsDXzpejN4i1ZO+Qr+AznU5fczHd+YLaxhWEPd+4vTzUkkfN
	 1J81qCO3iB+NqH/txE/Z7cIjJROa+f+K4gFDVFpGSGtH3ViwTRk9h2iIAbiQk6ymb7HNH
	 jCNg7x7l8l/HsJGt0RCb+cuSUV4mLuqKAocfP2zhHREIrwL6Is/VOaoLoc0Zr2YC6WqUO
	 MZGujGFgJm4xZoHnhQEiQ0ojYwlBgQYZJfU/WonRBqHIzsTtWC/t0AD2a4QvcPOYSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R4+mI6X91/rKykGDKfm0UwGbzYsTbGQ4Xd+QbJLz3Hs=;
	b=toPQOAM+KL+bYkttjKhPTsAwkYOrcfFhnqLCs0fZwDpUDKTMU0qAWWWQPjRCB79LrI3e
	 SgM55SvXLHVefdEiVB2p7XJD1j2X5NILgkMehliGnrG+6nGamj7ZP/4c2Ry9e9OwxFgZT
	 oUtJwArH0RDO+gxzP7h51rxflwxBfhX1U8qXt0LL8od2bOybAjmMszVGlZxwPZZl3zXG/
	 Gb7qQHhLeyK9cnAVN7XZvzYFxlkbuoVX91xtxKt5VW7IGQVOejx2E/gMErF+fDcDHbw2J
	 ddaL26dfCZNyeI6uBDnc1gKgO2sLWCH7js4Y4P7Pq6zgdGVLWBH2oY9Dcybot2dZxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Yb3RZ5Cs;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63648606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63648606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Yb3RZ5Cs
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 97D823F323
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795043610;
	bh=R4+mI6X91/rKykGDKfm0UwGbzYsTbGQ4Xd+QbJLz3Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Yb3RZ5CsNeLDJz0BkBwPzCikh1e0L6kfO7BsHG397yxdfFc7KHkEVHo/E8TbzE+TW
	 Dsfiede9xsja5IMh1ph3rIShKBULdIaNgJ0WJcvQU+Mu+Dl4DEBxhdcOP1GnxQF8aV
	 WNyqVlrz5tUtAKWTlrKydMEcjbO4704JbZTOIZC0vGOGGceZrUSGIAOxoUF3ULT+IP
	 MH4ycoPKyfhObWPcMbIIqeRcykYHaJjEes0p7xLwFaSZH1cnziaswcQtkycjbL/AM5
	 Rm+HFSDa1UJghEEGAr2uvn9LKfTknt4AF1e31U7TVpwK/xpumM/C2eqfIJtYbKrldj
	 2pZqgPiKhZ8vuIjzUyyStnah8VoAVRItRVacWRuAiQudxggJXycVpm0ZYK/0POH6nQ
	 tb8NDVC78HQX7MUv4YbIy4iIhrod6akVF9SdrwM171diH+s+1oYtMcBIIem83DNEg4
	 DT1Kr/IU6I0kFRT/ydrh/jXbzqM+CvT2EthGWlDIXbCJiAoxcxRrioR7UgTGm4IHRq
	 G1Qu9nx4Gr0aVDZk5dApexdHUX2Yl49vzLVLVeZ1rhMHwaYd9gXAV2cT0adsix+iRR
	 o3zerlx/8sgrJLuPSMEwgPpM0iQJELieubHpDEPAjwzrhD0TAFHd6cza5aXjqdCHCW
	 FupR6VQtOuLNNqCsF0UBkTOA=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1961752eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043609; x=1795648409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4+mI6X91/rKykGDKfm0UwGbzYsTbGQ4Xd+QbJLz3Hs=;
        b=R6+/TA/qGmXUnvYyB9D+8jOBxK2vExALD4fKs6LqPZLLS1a6KexqEq+LEihNPtE5Nt
         bNPNZO3/mkDWozipuaaE7/mEbA+VXgAc9BF4xbetHyt24vc2i5CC2fgRIoS3ttvY5qb4
         xmBBXCIOIpq+81+hCW/IEQBryxiKYvU26Ii/YOR1r/SyXuIKQfmBE3yRT6kbbtTTQro8
         Gz0dz60QIHldUzAZp0scprHqGCDpvTfCO/6hKbeRT01fUwBXGs8m0EYL/4YdO5ZteGCV
         v/b5mPyb/4ZWIdb0WyJS/+2wnOQdS0Ce/u2JXQ5ZnVkUbcmtpRjae5lhe+QMcMh4iwG7
         nMPQ==
X-Forwarded-Encrypted: i=1; AL+hErE1L45t62JBPH4ii5KvEJWz/pSlNAHbpnYswHiTNZfzsjpomLTOJ3sXTIb6YDy91E2INVtQGsDJOjjmN/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MMUTseyCfjR8Sa8atW5QFioyk8JnBU4oqL8lMLu8q4J50UaPy
	QYmnN2MAXoS7mlqTBsPt12gZOolvhk0kfOwGv1TS96FVoaNVXoRgRcNutvFSXUr8AdTc1RMHYyO
	HaNCZTjy+OrW7pNJY+ooOpOxuvZTLTDKQ66g1s1dtivCyO1pbCPCzvYpd1NwQ/3NX8YLfIjNY5A
	SIn6a8Pw==
X-Gm-Gg: AZFdTZfqW2e32GsTfsnMadMIW1k6vo2fMX13AoY5UGspzVni7Hs+chFZ/9ntpdOh0iu
	m94w/XDmxpBMLbtM3eZMfL/gk5UZSuyiVPnQKEPHvDuSaW6v3RynGTN6Bm9eCqBk4ywh2pqL+Bs
	9HdrxfhG8ocFiQddM7ZRzMC05RNX8jv7PLBDhYNlrlu40HjMElavsHP0modaP2J3/SKUfE0xiKO
	MLyYsh/PGwD1hcWnjg+1HiGvLDog9eZ3XHao3Adw2jeJFULK8wn63S7LRiena+nt0AMKp/0C/Xq
	7zCSV8Jigpu2DjO0qGqC4N4JSWC9t2SYlwmEGQncArlaLkYmoxrK72ecobqr4tFIxD833BQp3Gg
	MI0RqNG7XNZnbtVXcIg2OFXQJ8xPN7+Kx1kF5l1bhi2Sfcx/U0xeaN3Gah8E=
X-Received: by 2002:a05:693c:26c7:b0:36a:1452:8dad with SMTP id 5a478bee46e88-38280c2fde1mr3891056eec.20.1795043608438;
        Wed, 18 Nov 2026 15:13:28 -0800 (PST)
X-Received: by 2002:a05:693c:26c7:b0:36a:1452:8dad with SMTP id 5a478bee46e88-38280c2fde1mr3891022eec.20.1795043607843;
        Wed, 18 Nov 2026 15:13:27 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe75b5sm10429718eec.15.2026.11.18.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:13:27 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: sahil.malhotra@oss.nxp.com
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	herbert@gondor.apana.org.au,
	horia.geanta@nxp.com,
	iuliana.prodan@nxp.com,
	jeffbarnes@linux.microsoft.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martin.kepplinger-novakovic@ginzinger.com,
	pankaj.gupta@nxp.com,
	stephane.debusne@cynove.com
Subject: [PATCH v6 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Thu, 19 Nov 2026 10:13:17 +1100
Message-ID: <20261118231317.58876-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116180523.863575-1-sahil.malhotra@oss.nxp.com>
References: <20261116180523.863575-1-sahil.malhotra@oss.nxp.com>
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

Hi Sahil,

Thank you very much for reviewing the series across all the revisions,
and for re-confirming your Reviewed-by on both patches for v6.

I will not send a new revision just to add the tags; they can be picked
up when the series is applied. If a v7 becomes necessary for any other
reason, I will carry your Reviewed-by on both patches.

Kind regards,
Changwei
