Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175019;
	b=kKpWx3F4x45Qdt1PdtZ3jl+8kxdFFAM5yX7IFgiiciiI6U8dCoDdeMHWczrMqdazdPR9
	 w5qYUuW53+CmycuFrVbPKIaCUkjdJVY/n9QF5zTPMkfcm5sdvVnzbpnBSSA139fPrsv5r
	 YxtvaFspcxuHBhgFtrwBk1MHXA9LutjVMTLR1GvDXu2eP5D0Xan7O/8ZEqWu1pkHf+uX1
	 vjVKsHD5wTBeHcXGrbjkNGB9tQNB0koEo8dV+enaujBTL9e7Z+zdGMF5ddabGJSoVGnS9
	 Vcat/nPDpBJbp877QjMjzPmtD+amK3TaLzL1VusmK+E53y3dw4/jDzmrnQlUYnCGMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=c5hNxXDzpjM4GCLhWz08vT+SgPprdxWiBsctgd9Tum96dOOJuyaM0f2dtfGRsK/zN9AR
	 cmfZbLVGqZRJ9Cjm2eAf+IjH5cZ+lmUTJpFyBYGwWV/i7xmv8+/6XRUDh4x7f1f2Uq1m4
	 VIBd/xsk9C3IRGDLJe+lPT++arhPNFIUnVpXiMb55zJ/j7zeDN2Xzq5YZ5azV2Q8LZ5kj
	 Y/wQ0iJTDlAms8R2Qfg3W2nyfUB7TrSVk2D9WLRQcgQVT9IAaWLEpucCRONBGME6z1ut/
	 m+xT63x+6CirXVd5YnWK9L9wbhSbdZMqXUFeXPgBe0+xsIo5xVHpX1GAB0MukqT/aig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="mqRu2u/0";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AE760A2620
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87AE760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mqRu2u/0
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070781f63so429480b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175019; x=1795779819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=mqRu2u/0RE0z0w5EzgfeO5J+i+977IL4HjmmtHZryDVnHiONi9GdXDEoPDWRUrR6zX
         u5/h+FnSs2NE7wmFDVzYmMCCpgdPoNJRXCvbzsQ/sR1Og/00uk0tXPLSZG4muo6rz2hC
         Dc29fePt92Bd/Rfzv94lmCPOUDy2WMTdz9F8+ovUpCtZG6Qy7LH79zgcE+VdR/gEBREi
         4gmfcF/HPntWg/z7d26R8D+jNpQJ6C3wnoJ3sBoRVOuuUKEBiwOuJMZbOwtwxshU4e9b
         gNAWPXFBbZ4R3yAx253NjIs+HMEJ5+e4hjNss7T1bbGzaOr0nKmLL5tqKDNIZpc29RX3
         4cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175019; x=1795779819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=HAkK3gWvNKkd3g479UK5QXZtrPn08cZailbFQu9Fx4R7VJJtoILiL2DZ6mF6iu1UKf
         SGZ9DHaSy9Ck+vpLg31IUeOwy0Lv40NH+pTUHdrWeFgEY4itL26wjkRkoORrZD1g/KsU
         bF55EpJWshX+GNlv04KUqyyKTX2XrNDfbLj8ZYVPB6WznA1D/evtgmYwbwI6JDub6sF0
         fOpbxWFiqr5UbdPL4edVe4cZKLHGl5+UNQjPrEbBMFj40Yp67370rIrgymq22kBhDpQh
         2YC1sydMs6ra8T3r608ALr6kU3dqAIUggukxB00kve0lOeap2R84FwGnxTBWMqz+cHUv
         UoZQ==
X-Forwarded-Encrypted: i=1; AL+hErGp7EE7baYMKPFIX0n7gwWUGx1lXWVYlQ5L1QpBxay4jlPca7dT395JjHUW57jzWg+rmxyX7RF8rNX/mDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8utqEnP3YGLvfk0bulxfdLwfrFT3XclniJhXk3H4qwE9iqAKPl
	pGjhVwdYcAlwqWmkUY5cKcJQIQxP6v+FP+wajOzqihhAv4VcYQ7WSijxB5VQxOcW8a78Xzu6FlV
	w31uvscE=
X-Gm-Gg: AYBFou0FBF/Mz1DI+xi0VJdZ/jaWoeppnykkPhpLkkjDzwODHAf3Uv4e65VtC3Y1evm
	DPthXq4c8Pf0CbJCNeRw8bt24J1N70wXxr5JyBBRRZciBHoua6iFRE6rQpuz5RTBJY3OD8wx/xh
	FJjmTo1m6jrf04Zd7ypX3K1o+imkY5tP34drAhRdFsDVKiVjZga+6bB4ifr8kEZW3Zld71S90Nq
	yyD9uLKx/bIk65eTwzd7tkQxPIaq2sB8hF/gUBjHUhWNGfVCwi3R7U0Z2MSDvliqOHce2Kl0o0A
	xlIaKQIT9k/QmGacJOzcK8LdREggX2E+b7QtKiJn/VdHezzO3cOfa0y9KxClN3ZxvgoJ1ozSHqn
	qtbD74EpQCo95geaZTdUyTrZRqBfnKCeZhY8U0Z/3a3OjEzG1/UjuQJrkHSxlqWH/+p3wAbNWfg
	JVqbVz3IcICXdCQ2KOwxzuPC8t3425X6dYjCeUkC9h4uagJeznVyhNmID+ROKDvDONTD756r5Y8
	XkCTXEAVPapuExVIDi0XKX5dF6Rt8A44pIwqiC5lwZJc02fSnJlfiqe8Xnh52+aC5SY8XCwDMw4
	wmyVTjICarcP4zJqlw15dxZ6LcewlxIhU1W/dOWOqG6FcwZ5l5psGAkE5lAl2IYx9K1W1nB5UDp
	dBEDzvPS6ZLf97tVpSfXYg1hqPzLml0x6oQcr
X-Received: by 2002:a05:6a00:4149:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-8c87dce1bc8mr2671357b3a.59.1795175018797;
        Fri, 20 Nov 2026 03:43:38 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm1386231b3a.39.2026.11.20.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:38 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] scsi: mvumi: bound two firmware-supplied lengths
Date: Fri, 20 Nov 2026 20:43:34 +0900
Message-ID: <20261120114334.3072348-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
References: <20261013161620.3210533-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
