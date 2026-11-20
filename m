Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137145;
	b=von03k5TmbAPN7IGzI7iNfq7bKnLJynIVcyGbFAtODXa9+lj4i4Kk8btL5muWAiJW+UX
	 Tz0RIyFaBfvw2yL13gX0hxUUY0GbpDm/2XTmbw7HQV3ZVBFonTGGbrF7LZm+kE1j1Fark
	 FbuUJL0TFZwyu5ECIsiNDdMm1ydz4ETV7b00nC6evg+KAuaJH9ApNiQcmKb61Is2ZmGxJ
	 R2kSRa8M/2+v975bDhLapbRqEFzNUbXklQkshcY3L0CKcBB7hYsInTMe8ORNvLk2eewWb
	 KfEFpKXrTrPJmmCSO92gEq2GnE9WEHKWwBjN1Ct5hxoBwGLpBv1EsA88mUPOrxYn3cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RSvQtmGA8qR9VJRLGzOeM5PeV5O6KqCuP/U+uVUr560=;
	b=IjsuY4erPXuKs1tE0ffd5lJUo9ncxqKGzSiZ/82X8chIaM9HAmCgFt9mu1AVBK8CplNM
	 1JuzJUS/axRjrYNE1SNPiZEXEeqoXpKHhFLgcZeUvIRMGaCu3kxMwyF7pLrf/+/1zeg8l
	 ynwok+bKfaxUQAwHRSurj6/J5UWD0fejgBh2QHofmFqBifAbOFPox+grjHn535YdmB2Yz
	 zN9yf5QR3zmC/sItuLBq6ENAJoDFWxFPAMdjlSoibVS782JyF8bv4IKrdNEoG23IynFUI
	 aB+ENqxB46a42LuZ0jkJWZYGmqDzLuunjwkEpPwy/g7f8PnmtW6adGb10Z3MH5d5D8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlsGCg0R;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FB606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08FB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlsGCg0R
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a8cc11ac42so519082c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795137144; x=1795741944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSvQtmGA8qR9VJRLGzOeM5PeV5O6KqCuP/U+uVUr560=;
        b=AlsGCg0RNzLQ9aozfabMWDwdTx6zgLTww/CasfLIoz5jheG5rBv+9qjwPU6qwNMHO+
         x0+OVNpFEu65XlBcE0mNLJr5oxh+YfZWLiqtYV/sS6Js4pDqXD0siNC4qnOGWO5G/Q5w
         Vnl8ItHWLE/jj6KJIZuVVpsqNf+QaZIu2MC1sYsFWi0SpT+68deTEJ4R8UbjpqIZaIXx
         +c7HqjbJ6/yqi0dhEgw/xysOptuPxNJkn7nt9ddo0AvdThz4+Fo3CPAVSbIHhYZv6yex
         LA0jaWKlbpb+0adE+fb34Nyiy/hZYikce7gjud9yDiu6DNah73lSz1L3HAjT6FNL1wAW
         Sleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795137144; x=1795741944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSvQtmGA8qR9VJRLGzOeM5PeV5O6KqCuP/U+uVUr560=;
        b=Y0tQmvUohha/jZpQbziQnde93+ZNs/22X62mdeJj3CI8YSHTzf1/RlWwkFZh+ayuWb
         Hyl2zu7nAOkJc6rVlyxEZoYiz0vcQD1S0ScaSjhrxgyWa/SsalLjuwLuTLRuGugRNWQs
         xOoICGy70X6TTFdmRCcDAGCa2ela3lNPSmE9ASBU8C6YvqO8AKsnszdty9adJuTVaXw6
         GQOaARVc+pYYRZDV4K/GRdLikLopLKcyH4jtRWUyHvmbvBGmRufnN2bx+VTgsvzvxTB7
         L6IlR6lhpj1JltkXZdV3Ceefj8xmb0AkKC2PKz5bUjgxOH/qDGlVB3pJ9zUVu/XI+7Ig
         qPqw==
X-Forwarded-Encrypted: i=1; AL+hErFuKrPnS5uS6UF/NfnZBGRdHJ/bmGjt1JInDyaWwrhXaCIHC1pdrIEpb+O06rJU9UK+hwoo4YQKiqoHi6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xtWAUJY/hcg5zUr90vL26ndpBT6IpHRRMKs7cmVKJCYO3V415
	N07ynAt3oX8Xgr/2o+3ib/LRhTu4sO/jOcQRU2MP7DQbkRDwI14RnbHYVJBSJ0o=
X-Gm-Gg: AYBFou2flKyA6jW5v86baUYjUCOG0M8pmeuLnj/ZvDXMMbrAa6dXA48wL3m4ZpCjAi8
	SDj81H9zYcmvf8245rhkerGvBQ8FwGHB/9xNJDHqGA6g1xYEM6dYH3rA+VOuiN4P2ehxXv3hXXX
	N+70gjCN8fDQiGpurDXNXkW6esRpmwUVoUcBL/o173Em7puK5yqkWYY7cvHjRoa2yxJYRvlEVJM
	pgjAHHWWlQEZW0ybYliTqZDl6ZVJ8MQ3dBqbwTuMGBX1QI+3ke/R1eb2v3N1REMFEFZM7tZg53p
	7xfgoE/mL9DGtF363V7qYhOHJL9OAynu+k29NgN6I6+yeLnvP36nES/P05/WWUSY907cvNy0qWL
	nqzyQpqWfGHMjISQcnyrW9wPgagrRkgZiFEutL/m3nX60w3BVCCt509Sj3uJRPIU7rM0Nzuys+/
	fWMf0f81MgDumN+Cs2WXjzioL/wY5BJzVcR4SDPOFo5TbJWggwFy8iQ7Z6f8QynlEFJ+9emgHum
	j4SgM3uUwf66VAaQ640Gn3CXfST5Q108Fkq+ijRPFs97lL3ucZXjy6Q9yeW9/NmVuB7AP67Y9B7
	pBTN6Sn5Zw2xPV6HVTyaokPh9ZoaRt1T1w6e1vHI0+ZsMKCLNylUbZEU6jgIKm4=
X-Received: by 2002:a05:701a:cca2:20b0:1b5:3417:9bc9 with SMTP id a92af1059eb24-1b5568ffe5emr1217643c88.26.1795137143675;
        Thu, 19 Nov 2026 17:12:23 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.23.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm2370006c88.3.2026.11.19.17.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:12:23 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: atharvatiwarilinuxdev@gmail.com
Cc: lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org
Subject: Re: [PATCH v2] ACPI: processor: Use Apple-specific methods for P/C-states
Date: Thu, 19 Nov 2026 20:12:17 -0500
Message-ID: <20261120011217.1296-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113131243.28214-1-atharvatiwarilinuxdev@gmail.com>
References: <20261113131243.28214-1-atharvatiwarilinuxdev@gmail.com>
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

Hi,

Can i get a update on this patch please?

Thanks,

Atharva
