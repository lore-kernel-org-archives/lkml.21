Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509094;
	b=rtJ2QOZhzVs2FqrOCyxY38N/zHqwq1oCd/l2BxO2UN+OfdGoOzO2WH1U25nEWUtuFB5s
	 YfRa2CU4t0BDWyelxHAfyJFdASrVfDnMvkT4erm2fTovajgvjs1c8r/GdrU3Xz70LOrVh
	 mk74/QPLkuefLwLSE5aaqwwrVyrQyG0AJIWnXDQKTNGg1Z1FJWUvlNHNCsaENCyRXRodj
	 xDZaep+IeE4iJV3qfHffdosM5Hvx+wckSBkVyux4wsju2m7W7Xga5SQzc/gJGmtyh3BeL
	 dNyaVW8gkNi6fo/UGsPZXZuUAPGdBVu9FbzvS6H76scB/PrwxgN6eon2uyD5pNhAqqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XHQo84UDqtO6q2O2ZQYplON4CO/BMx7bnVbK5tRUoek=;
	b=Y2snOvT0lstvHH1j8Jn91I0rgdEBmI/9oJ7XSV99IN/V40/bZvUJKa8lBoefz8A+3eaU
	 fVLc8/NbR3hnU54dIHvuc1tmQk/+UABRlrML3ARRoyx9Zkw9+J0E99gHtigm491Qo7Bj4
	 wPCw92q1eLMdXwOkuQmvNKJKI58HtRwOBUjHR7D6L5ERKrcaymYCBfrNss0FdUyA0h/C9
	 i3zTfTQ/0WcHO5efnRsgKBPkS23RmqS4Mr8Hr+3urRXm+kmcJQInUH1ObKozOgo/qnCHL
	 7mwwN5Vq1/wK0yaWFYBIVijO4ahBQCVdXGbvF/vGW2UdFm4emppjAxn/Qonw1Z0K/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+56LR4e;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFCA606A336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFCA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+56LR4e
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so53951765e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509092; x=1796113892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHQo84UDqtO6q2O2ZQYplON4CO/BMx7bnVbK5tRUoek=;
        b=n+56LR4egfUrW9xjbZnV85Fy2dfEGpm6XnKbuS0OeJt6tPd0SD7qAjQdhPoMav3CHY
         y7+pGRTT5NVt2NI9d+jpCcP7TxX+MdXxBBaJz8hZYtlvocp9LpD8HwmOhfe9GfbxOMxz
         PFvvtCQga8I0WPerr+P7LcGqi2qUS7Ga21wGGI7LRV7M7VPATul8yqIxbEmpi+hG0vs1
         MB+5WZAlgsZaO7GBzq9jOlHEOx1L+3CQ8ZdWN5cHTEUkyF9JRsCh4IlGEzhlFIcosDLv
         JUMCj2AoADLy0wE9UFGEgLXVUn9yff2+jfoaUZJhC0ueOaA3nT6yiGofF4QL4O8dF5xH
         faUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509092; x=1796113892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHQo84UDqtO6q2O2ZQYplON4CO/BMx7bnVbK5tRUoek=;
        b=qr3Qg87aNwIE2a7bhvL0F/KyDn3Ci7hF08PDgu0gmqNrqd6C1SZZS0y0fp+FD9CSlx
         MoBGSQdomteS5XwPpaLWm2qmeiyXWUYLYJIHbOUlGt8Fo1ikyRFV7EO9sJmodvk/aIIZ
         gTqZIB3l8uuQBykss1zjMALu/VkDNm/fOs5EWDMOfLCoSJ64lix3sj1NopFxtPIb48hn
         Kq6XiDfwkc09f/ht9bItFaylVn/XS1GEpRnmd/XQY5VJ7NvkWLtuDtRSR37uIXJ1IlKU
         T5BA5pl2uaxOGDOFu5B9Za0n+RZc1I3NGv8h8KeDvifS0W8zu6FQcPga0UfSuQqySpet
         19TQ==
X-Forwarded-Encrypted: i=1; AL+hErGswGiZL35UP96umlCrBaqNamtJicIbUgxwOo+TzmitPgo462dTPYrzjnI61VZRaoVajPIVzThhWCI3/h4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GfIlCOU18hRdPb4u6ZcG8R5seBeOGEWDXyX9KLvCJ//Cq41s4
	kp9QIX29vCZAErVyXZtquX+84kyGYWYaa8gFdRarhW5zZo/gzQX62ziH1zIYg+Le
X-Gm-Gg: AZFdTZer3br2EeVTYPrMGSqgJm4oqIlIoH/zZZARqrdOeTcY+CW+KkANaxsoKHSSZf9
	pm6sl9o9BzratmU7mPKS42L9Aj9HgXfF4k62I2tiUfybxCjgGPJiJrSDDMtGJo7cncYLI7+PrDI
	RtyRLjChcGqw75VXOPVjLBShmZDGSX7AeMuI2LFwtsGvusShzZ5TlvWamDLJ8kVxZvB9poqdrsf
	LuDYgwXv6pvlW9E8xPT6FlsFHV6OVwBkhkBehrsBATV9zEQ/oY3JvGlORl/aBthSDPpJGuwfeq+
	3ndAeDJ6hPEQbdQ5F+cZgbbW9zX0CjH6fDAT/zeFmH8wk+hkUe1T2aDyRIPMkLhu6LLQtCyREJg
	mUVYlhO1F41NAcBgLTpjzXh14u+jaChhnNBr2w/wEMSrIMquYcnhbtdKalmKc2VDNG7h8SSsKDI
	4fY1FBXwZUCHbL1sSkZWJrSW4Y9ALwWew5++lyDS3nPTqgXGaIA5C2e+lhyCbqFaqRxOspiPn2Q
	NAzIRe8FFfadZvhMhHwHoecmmRR3sTKl6KjLMV/xDgrgjrKIWpmSLm6K2FOJgwDW5S8iVq4CND/
	PJm6g8Ekxx/u2HHwPKObP8FXWDoj+Ef41QA=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr269785165e9.9.1795509092042;
        Tue, 24 Nov 2026 00:31:32 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm419483755e9.1.2026.11.24.00.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:31:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Tue, 24 Nov 2026 09:31:30 +0100
Message-ID: <20261124083130.206249-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124002437.213112-1-luka.gejak@linux.dev>
References: 
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

Hi Luka,

> Could the TBTT pacing from patch 3 go in here so the commit that enables
> CSA also waits for that last TBTT?

The series goes in as a whole. I kept the pacing separate for review.

> Could the driver reject a template that cannot fit, or stop the AP if
> the download keeps failing?
> Could this path retry the new beacon when the download fails?
> Could we send the locations only after a successful download and
> retry the download if it fails?

As in my v13 reply: hostapd cannot request a beacon that does not fit,
and downloads failed only in unbind and crash tests. The other beacon
updates in rtw88 behave the same. If Ping-Ke wants, a separate patch can
cover all callers.

> Could we make sure the mac80211 fix is in the target tree before
> enabling CSA here?

It is in v7.4-rc3 and in wireless-next, which rtw-next is merged into.
It only matters for an IBSS left during a countdown and joined again.

> Could the driver reject this before it starts announcing the switch?

Confirmed on an RTL8822CE: mac80211 stops the AP at the end of the
countdown and the station stays. The AP then needs a restart, as any
channel change does today. If Ping-Ke wants, a check in
pre_channel_switch() can be a separate patch.

Mehmet
