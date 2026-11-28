Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853651;
	b=Gr7Kp9IkWDsmtbWvI5UvCpl8AtVeufz7B64CdA1UoSsY4Z/Gn6uTniBKou88OsJrs+pV
	 JwPN3x6sanslZ79VChR4wPns9qEglhRdn3tuudRVfaA11G4SW36ns6T9NRJ1a0NtRhkkk
	 LArOgZsPWEdbRiQD+xf1CipSP1XcuWfNnrqGp7d79+RiPh9qDl4VHweuBvSwRkFs+wf1O
	 bjYbjzWRk1fPFyvCUxXhXXmJpZxt6E9DI7J5FHnoZQJTXSEPNtwbB8e28nHCDNTKp5lEz
	 rQVw8uMVtLQtGryXj0nVYL3RlmQwqqeylYbRtOzOzq2RIjM2v9kPA7QtzTN8Z/M0pEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=xLHAqWlSnGGbtkvhm9a5S21zN7ssBzPANQZ+YAnf6vEEs7NjcC4Ow6BUmlBcaEF2U2Sj
	 9cJDQeoZt7qSMToR0dalLWeBQNO7rwZGVkF/bRCvI/Lulza+Rp6aKYv0BKsXgQQE2Mgyu
	 XLQxpZZiqKjv/aI4LAIh2fk9OsMlf4QtQGgxvARyj/L1My0RnbreDGpLzw+ssrpjQ8z68
	 IvR01iC30VLBiNULRAlbKwvdltpO5S5qIZYuAFYdLBtS5iBTiw6XldLxewlOXk2C3yzD2
	 6kHjTG9LoxwpfeZOsIZxfTN0Gs4FKFy60xjzin0Xo+xVQnXwngJBu9FR688CEpVx4IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LkFHR+h;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1E3606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1E3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LkFHR+h
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386ab9ab619so12471660eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853650; x=1796458450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=0LkFHR+hbGSu2gI3IDGcRw0jA4AabyAmC/x4bSWTV50NzBwS1B9nqK30kMEcSHMN1Q
         mYfGHnRyrmAQ2HRXZZyDKhLgBRpCqjUBnCk2IMaQICVlg23sFOyU2HZp46TdZyzYejAd
         kus18h3lhSKl3mmKUwJom9w1fVgXVzif983/B6GieSZ8LqLmm1V/w/zs+oTVaFxVmELl
         4c15LYZMEj2ld+8owI0SF9tjWlFOw0eTc3IFgjY7P2MaCm/yf85W/sD477u9b5U0wveK
         4CbRrbbuPrEUUfQ13R6kVsIbDRWylbY/dxvm8p9yrVY5/v638GkEntjyUnHRuBCFMzKJ
         Aq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853650; x=1796458450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=TzgIU4cM37Kg88pctuJU7UdQhhxF5womppnKCi6qkL2lc2/YGmxUX84eD6tsPBCOBw
         PM84qKi++hdyEI7ZMzGaGH9AF+AMPOB/zQO6sZJhTuwkNoGEbEicCgTmqRALPTLlhTZe
         FAfatAKjfhl9RCLEdsOoL4nTWZdC6jrmz/anGDYIvy2WA1Oh23gYzyt4SNbWdMfSNFRp
         QlBn7iy9LVg7lO5wH/FeT1uKyaR6jmo2KDVadRmNCxtzKgLOTpKXrCrqoJKX3kz4FTau
         k6pYul7dy1/FBAg/B43Tx42rx9fA/RjKXeis5FBU2n89SrmnOIkz64y5p3/ZP2QIRGNm
         lTnA==
X-Gm-Message-State: APuU4Z+/FU+KYyiZOO+FW/dHXbqX9N3UAasMykZUj/x5O5itZB5aSIxZ
	Gc6aJ5EUVly1Bg8JXDtebNdO0Lo+GOcqsE8xWJkVB1w9nASIxvwWaMUiscRdLw==
X-Gm-Gg: AZFdTZchiuA7V2zP+/lBeLF4n8Wg3x8vEYKMxysXsEOP7EP/koCaiwCH2RQKlyse/vw
	S5+8QNyPgOj1W6l0KOmiJe2fKOIMKLNFlIzDpYW5+1NOUPPcVdlT3PgQc481Gzpww9hW4GkGf8b
	lcHP3Y4CUI7Al5eVmCuwani6y97ah9cmaRZpWJWQuemKYuv/Dh/inLy71KQTVX3RLYLDmSE7MPt
	1sPXogHQzvzEPhM3WmNGTQtWAAVPsQajFhN3FAp/PB69doGJQ1DOivhvRixzhZcD2+/BV+6yL+5
	1jaeVmWbAVtNhITIdcDU20nuooq/iHrHNPSG1wVCO5tF3TA3v4QwC0e5PkF1YlbTfidimVwCN4s
	7FUFCXMFGI3FjwnDRTFke5lhxNjpd6c6emfkDCSLMRvE/1eypyjDddiQp6f9Qz1bfOLyVELJwqu
	Vg4IaEc4LmXjH6FYNtSM7HmFsORVrHvZGWIXCscr5r1+pNof7wbixqV3n3KTHz2tvrupkuAshTx
	5pa3FUMctWylbL5YlES+eZpI//fbghg9ALX14yLZ+Y5IeP0O/WfKZOM9GWzbeezXBQz+dDgEdzL
	ZxqWm1GgXz9ChS4lbHzShuXMFY/l8QNljR6QC3NgVazwvK8smoL4
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr26765984eec.36.1795853650596;
        Sat, 28 Nov 2026 00:14:10 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm72360114eec.20.2026.11.28.00.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:14:10 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: vmaster: Restore follower values on put failure
Date: Sat, 28 Nov 2026 08:13:46 +0000
Message-ID: <20261128081346.3007-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87ik1imbb8.wl-tiwai@suse.de>
References: <87ik1imbb8.wl-tiwai@suse.de>
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

Thanks for applying the patch!

Best regards,
Sreeraj
