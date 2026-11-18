Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032332;
	b=tOX/0royhWFkkY8qi6R9U2hKrWBkMmr2ySfgl1LMmsz1OAF6ZZqS+d77T5ix/B3AN9ug
	 Te36nJ8clVIxLuHXTgyNqSj+QDjXR6R5wO1+lnvM6uIVKmLo1TyZEM/Ym9UkpwFUNf60a
	 vzGnGZHofplHp7qAZgNjoo4HzwhVpKTgr8y9/UftPIQ1ta0N7lUNH0FlU5rRRZ1xVrbSo
	 3fso1tT6kcPmwJq0swryM8m6iYw6gX+55b1txUsPEoNmF6Vz+5smS5sKbJ4xNkUvjXM6i
	 5x9lMvo53MGdrGq9T6C6NZfsWmh+bkGdaXksnTe1DF8G803JD50SX/dnwp8Qttbco/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
	b=oCIgDt1iv1hhOH/GK2beXNMicvXyRt52431cdOLG1fWVvU6+k4UO4BnzWwB3jhomp7Bl
	 uYHDK+TgKrppzCTkqLSN4GDCJWuaqV+mGcDMPCYu2ztuEeZnggn7QJhm5qdk6ZoU7kgR+
	 gFrnH6DvQSeqy3R+WfM4zfxDtrjbihVRAbhTbZZRkomenr4/l9E6fdSp7xmho5mIZn3eR
	 SW83Vcvi+47FHMDoTGjuj69NN3K4kdwP+mM5UF1kW16S04H6BDvaCh4K+ND+xXdsT4XfX
	 jDcrRhWDvScA0DrPNzgqOxzxt4d7yIANccbrlt2ESL55X4HYdb4TzqrxY/DoqRGCmqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FY6HgOSO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA5060A2633
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA5060A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FY6HgOSO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40312e2so3939133eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032331; x=1795637131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
        b=FY6HgOSOJk/B1JD5ErvW/oO/+/P2xQrqnVF6SES+Upa4hNTakVRhVg0gowqNRZNFh/
         3+fVjOOYnFMnjAUchXcqaY31if+qJT9qMCyhlKMnBQLgtZsgESZlBdnu49iDYrFtZ7Bo
         hZ0rVXMU0FzNs8zLXO505C2iIV+HrAV3QrEFI2CyCCG7P51W9D7SjpeR/91BBSLUZq6q
         B6HwhU2DHNyYG4zuw4UEpIvDo2BPIZqYV1aVnGOYMAbDHdEGSXKkuqniA8hwAFIkg0Lv
         53dFkXS4oNGJgjtot0JaBj6eesAp1vD+Gt6jXtuM5EnNY3Aq3ThZYtGKWTQAPn69Pn1j
         0M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032331; x=1795637131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
        b=eciyJPBHcF5IHr9U6ZaFV800IW11nOrQi7Raz2E6udZUz6ZhWmlR35GI/KE4t+ACwP
         IkZgheq+3cAF48h6jCesGHrGOW0Qpj18kKwR3rf2oVmPZb5vzf+0c/vUYoftJmRgAtjn
         gEQayLjZ0+DxTXsQWnebwnflBD8RdbOmuTaaGgBTqK4LYwDizcWpahNxJykyLJIfHznl
         eYEofvLSLfxlFR3vggDGZx1dCawgF5W8uV/ZB1bsszb4kR6lS8SCd5ZvNru3jOldi6cI
         KN7TMFGgv+Lkw91B/GDMX8CA1x/hiik84ahn91A9pmkCaSAQHg2ocefOkdbuPai3JCA1
         bdGA==
X-Forwarded-Encrypted: i=1; AL+hErEewfeGhj6rrKKRZJcBtCOk+7qotfZzi8GO72hkk1aFcOucQzb9cpsKSW6tn2rl6yYX+pfeXzPkrcjzYXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MJzJ3PyMMS1C5DeqKkJRVmqe8U7ZiTjiTu8lMOpjCKZ6BSlgK
	jhAdH4nbHiSv/5NJWoYg8ntwpxDnV6V6P6ShwwftBWmEBVT3JDpKFzOj
X-Gm-Gg: AZFdTZdyAMFZ7C3r67yDvd1V1wejckjCtRNzSsAXzGSNdU3vEojdkB/C6lG56VD8MHo
	wy0Dl5tTe//QTTZ48vme6uJyItUFzN6WVHPvRv8J6zgudkDFcMjlBxn5MO3H5MzRL/cLitEq6r7
	D3IpSRM542/fv9IfGLADt5jDQL0MHMf4+GVLOS4ioLsgTnV8sy+wRWc91c9BuQ8HDpMT2Xbw4pz
	YXTz7bbnYpNlBDV2MI63w5PYXz5twudEDUOtl7oH9N840S6sjlYU+TbtPvVTx0xEpqNoNAWjDQu
	RGEEBkj2rc7CpPY8+784/fMkXoSDX97zL/WUACA9/JCUmoHmyve8f9/fRjp6jukUjoUaNYki4ed
	0CpDNDweYkeW62CKZyCYak5n7NWvJ5jGKxYYqvrnqR8q8++pA24IaKS6EIAq0Cd+1xZdm/lNEd7
	Cm5lPbvWZ/5gCf5HvPhszqOLlO5ErbfTjcYJNm69XcK2ZEt1F3PX1vUPnbg9L0qjwlt3yNRKUGV
	L6fYX+FyT5bxl/7dRjG3HtfZ7HY3gt10v8awy7zNxgYNQJzLZq3gLeaI1mqvkDXDeZuyroV3dDT
	+X1wx51Fnoox7pSrDe1piP824U3Rn/B5m8SFou84AExYEvu6arsxuFli/AaUj1v7CNRoRe1B0P2
	uMU7Q0ACTG1BtgO81Cic6FVlCwLNH
X-Received: by 2002:a05:7301:77c3:b0:376:2ca2:d80e with SMTP id 5a478bee46e88-38281214024mr2770749eec.30.1795032330636;
        Wed, 18 Nov 2026 12:05:30 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm11032107eec.24.2026.11.18.12.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:30 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Wed, 18 Nov 2026 12:05:27 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617544.3136.16911407487347494512@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-1-ahmadexp@gmail.com> <179502617544.3136.16911407487347494512@kernel.org>
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

Thanks. I have clarified the comment in the v4 draft: the subword offsets
describe the default access mode, not the forced-word mode. The latter
requires unused upper bits in CR, RFD and DTR to accept zero on writes.
It still performs one transaction, without read-modify-write, for FIFO
accesses.

Patch 3 remains the first user of this flag. Other platforms keep their
existing access mode. The revised objects and accessor tests pass; this
revision has not been tested on the physical card.
