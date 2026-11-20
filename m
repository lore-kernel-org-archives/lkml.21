Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175055;
	b=uXB0PLr5LYCWXRF7Xaabuanu3s3Z9VPaMLcFslddk/s1NIw7klrpygLQq9P+/qSHEP6O
	 KeNzd44aCn9bYPaEOCxEpPzqe7CgMrLKq5XUa5fQC2+Q6o8mvCgkdwv6K18nmo41kDcQP
	 lR5mUsV5ts92Xx49tIbQYLJWqx8nld9YUajzdX3cea6VGn+bROo7/xBfAGllfEndMC9Nn
	 +Dog78c9EsYdvzDCP3iZX1kRJTjI7l04ZqZ7y+F/5fyz6EVZRB7n3Gc0phGXyvgFW3AN4
	 pqHqISKov5Yu4venLBH5ks/YU7AFjvbnZ2OQpMNovVKQRCKpl4z34R/9AwOWn4bj+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QkFRpq+JqVl3CgqxrgMexsAA7SJ5z2muFrI47UuRcq4=;
	b=tots2B74DGTFrPhnylmf5K9OWqm31bYfYR76KORE8xsvXDua5xRnyalkC/tR32xc7DdE
	 O6VUoUDMEfvejNcodd11mfKmSmbBbSYFc0znLwvZQOmAerGcbl+qeOybiLd6rESohhV0t
	 bI2ERPvgIga6FoJl+DOSKrQ0/Om70kLTLGX7VkAq45vH+zGGbmd1ZvZrtJ7q4ONdMGois
	 qlTeN8zaExqLnvxY9gU9mmw1+kGnUPP+pQ6WwWWHO3dFoLRMpTzsuGD3d6L99rtNuVebn
	 bARAGKDylMtXiAi6rXuvociGtPy2a606QrBCCQXKnaiLVO792KjjnEjUY3io3KddqvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="l2PVeRE/";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C360A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8C360A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l2PVeRE/
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1112520b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175054; x=1795779854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkFRpq+JqVl3CgqxrgMexsAA7SJ5z2muFrI47UuRcq4=;
        b=l2PVeRE/+XPysPPJhubEdgs4VP2M0Ha738NYuCgWvaR7wwTsmszuKbIlHdKEqIgauc
         3rcfnKqHMAwd4FPbK/HOto6KylyAxraMHKhBQvQ4MBycF7Q6LQdWQKyyd+jwtoTNAVIY
         5/io+tVoUvV5zQmlkNm6KE5KWBun668SA8M/ZDuSWE6Iam8sKOx8yOlMaR2fzFq7dIxW
         Kl+9fehW4s/hKmA/gjjUJZIIDChdsFcWgsmt/x3gLSjOHWtPHcVoIVdKYUN/upnGu9co
         Gal5knImfdASeGx8UcT/Qzo1PiMeWJj6uahqooUfqV62DePySn2+Aw6dYieP18k7xHqn
         +1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175054; x=1795779854;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkFRpq+JqVl3CgqxrgMexsAA7SJ5z2muFrI47UuRcq4=;
        b=1oIzIqar7AE7x6KTUs3a0iO0e1cE6RT/3X7l53nhoiv1P/riWHPsm48NfIAwjZ4GW/
         492lmeuQ2BWqSdVdo8pP1faDfMkowPOpIqVymaSfJurSZqyfChB3trx5Z7sTTUC43mII
         g40+Ac9RBBiyWwC5BhFuYiALqQh5vimCQBvsbPIW2ANSMNImS7TC3Pot92rEP6RwJu4z
         CqP+7o1STIJr8Uzlgx8yujtJidVvLOrQrA3ELio5nR99cQHJ10Ah0h6FCdeHkrzQwXTE
         lslgb5jLW8WR/j9MQG+ZXJ3lXcbhujbX1bqwOXmGlPbfQL4pqTkfEk5wTx0kkcvEUABO
         pj4g==
X-Forwarded-Encrypted: i=1; AL+hErEFO5hSWF86LrIN6T7ziup0VQj2eZIH7/UDIy5Scin6+QlfPJDVncwLoAluKDQYz3tgOiku2etoScTUQ+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pQ8MkF7MAeiU7GFte+wM3o5g2TNo8ZFlYOVKyKWm4AEy+gfos
	PiuVmG1qkS3MKwAQgEhJIN5SXw5jmIBt10JXWSLdwcoNWp8g8YbzMUIHP961l3kvD7y0GupamKE
	y7BM6eio=
X-Gm-Gg: AYBFou2nERGAwwQGQbz5V66wnJxEj+J9fkQ68TN8SB7ZxHLFNwOolhM1p7vyhcqRmW3
	88UK94ff8vFC1tkcCPHU/yBqH0TfAL60ONx9bETTN0vMwCeOQpHLfnrsO8Gpb5H59Wf/NBA8RYs
	3VoZRTqPalOLSdog4fbWewEgsISqXW5TCvoIhTwg4t1MNJU0CiAfYFLBmXD1QYXfwAKo/ZXwIH1
	S9p1NcJNle0GiYLmcVtLUmTceY0tG1kiT2TKwzzMW9VHglTFGxB6nxgUN2b4cwipYx8z2vrLUTP
	1hj+wpkBesolMQH1oQ0ySYgTjoLF9nSivYQyDRCOQehZWuoyl006zjUBNcnG3ZvwAa6gLiWDHM9
	NYDFiOZGo2/Sl+MinEPF/QCu8ZMSM4Itk9CLmkysPqhs7IULybGJqUbxoUF5VsJhUM6xaXPEp6B
	GTGTVl7kSFk3Qvxse4UigG92psMlFv/Yg+Mq0mP6w+VomHpiLrq1YIIl4oYj+u/5IDxa0dWiIba
	61r597kasmgPiZ6fQ2lA+2XuFiBX8G5JlerhsCjDRMrDBeo6eYMnT8BUXswGF1CPBZ9OKgRQdZJ
	rAm9sKwzjMLJS4TTVdTqG0Jp3VDPkZ36sAxZq7qKKUFeQrd3InnvUrXkWlc9YtF81ED/QCf9PJo
	W2Kd8AGj7WDCxTd0Eq78QD0ljJPJ7UgooPnPHRA==
X-Received: by 2002:a05:6a21:8210:b0:3f8:beca:1034 with SMTP id adf61e73a8af0-400aec05805mr3640080637.46.1795175054359;
        Fri, 20 Nov 2026 03:44:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1220211a12.8.2026.11.20.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:13 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] scsi: aic94xx: validate the sequencer-supplied EDB index
Date: Fri, 20 Nov 2026 20:44:09 +0900
Message-ID: <20261120114409.3072549-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
References: <20261015072612.4144043-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3:
  https://lore.kernel.org/all/20261015091747.4184349-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
