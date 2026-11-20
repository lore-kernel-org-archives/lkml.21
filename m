Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195123;
	b=ayJx5Lku1xuwKSGupxSoADs2LIfy76UFB2kYiDG+FXtNAEUmvS1zh8yakw9q3FKXXRVg
	 7pw3DKdFLYI7cp8IrEzIW19hptu3TgUKY1gxMyShsCc9iRwdc5zR/qG+aUkSxjoHeEdGB
	 I7g9QXbw1tIEgd5eUOChpYg5J4hrwW8RUiveJfB6JfkQUsf+6v3MRpUDBhBLQXPDQSDo0
	 jEH85RZxztXe+XGVUXRV06cVWBhsteeV8mzjTchQBcYsAicCdHiPI+EcNaGW42FrUIXsm
	 a+uBfy0g/SwZD8Nuda3iFgL6RmvtAeRn7oN0AZXPRMjCg6I2hWUPG7K9kSh8FdsGujQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195123;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=cBt4nWhW3slEZryBlmdyH/FECwlGZ+s7RvKZIEmSdmM=;
	b=1K+zwzxoMc5R+U7XNwTNbSYUsawXpLV+ETJoxJKm8ppFwtnkEaU6u65Pfz/WZqX4mPnu
	 XU5TY0uxLMA5eHKhxbR+HOiELWxTloYCaa8/zGSsG1WEXFPHVgwZcUjHZADwzPD4uFq2B
	 6giWEuMUudCCzNGJpG1oIF9LMuHAI7ah5WaQmFIfHqXuny2mWZcQ9COKZkCD5JKTqk3V6
	 YIpmflLhG8jr36pNj5hlAg5q3LgQk/rfxwwWJutxivkgJoE1Yp2Xq/hDH2cfVxPLB51in
	 aex0DM6afVWsmcZInAIrsDleIZRCgmyzSOHXknjSDUQyl+jgUYfmGAW2EcRoTIt6Xnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jcCffMEU;
	arc=none smtp.remote-ip=95.215.58.96
Received: from mta1.migadu.com (out-96.mta1.migadu.com [95.215.58.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B42606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B42606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jcCffMEU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cBt4nWhW3slEZryBlmdyH/FECwlGZ+s7RvKZIEmSdmM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795195120; v=1; x=1795799920;
 b=jcCffMEUEiiiQpKWzfxy8XAPIbUgCG1vFhUOrnB2nZQ7ILmySv2kI3/ZCyRyyf82hNU3uYEP
 FzuoqUzb5pADUhwVEJbzu6YxND08q3MWgNfpYPkBq8J05wxYlYx6mwSeEMAh/eOjtVnKqdXrFjV
 +e1JDzIwFhOyhfRS17CMRbFM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6695c19a26af92f8;
	Fri, 20 Nov 2026 17:18:38 +0000
X-Mizu-Trace-ID: 6695c19a26af92f8
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 17:18:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <0f2520cdfcb86395317a39637bd0b535844e34b2@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when
 collecting them for an iteration
To: "Mehmet Fide" <mehmet.fide@gmail.com>, "Zong-Zhe Yang"
 <kevin_yang@realtek.com>
Cc: "Ping-Ke Shih" <pkshih@realtek.com>, "Tzu-En Huang"
 <tehuang@realtek.com>, "Yan-Hsuan Chuang" <yhchuang@realtek.com>, "Kalle
 Valo" <kvalo@kernel.org>, "Stanislaw Gruszka" <sgruszka@redhat.com>,
 "Brian Norris" <briannorris@chromium.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261120170255.375054-1-mehmet.fide@gmail.com>
References: <20261120170255.375054-1-mehmet.fide@gmail.com>

Hi Mehmet,

Thanks for reproducing this. I was looking at 0bdc579dbfc2, which
already has b719e9bced93 clearing si->vif in rtw_sta_remove().

Could you rebase v4 on rtw-next and keep the si->vif check in
rtw_collect_sta_iter()? That should cover the case you reproduced.

Best regards,
Luka Gejak
