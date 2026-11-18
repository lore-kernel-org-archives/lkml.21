Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041470;
	b=pgxl5FY6eqLXGkVhKXJ5OYGEEunlt1qkLXSEZ8AnAf2RLKifd7IHIybtD3ZIX2dlh1h+
	 AO8CNP6IeGDAWwcQr37Yh/+l9X/8U+o6CJHzCSL/kHT34MlmCFZR9qBlGSOAVo7ixlLo8
	 w3FAhvZe3xS+ygJsGe0tz2ATya/WJmyIXU0fZ+COOmqLM3HisEx4/2b1TN1y05s3DWprY
	 nDxIyvDyJsmgebTFfP3SqB3/WpkI3guLhQraS9dIuOPX8xxEl/66Qx8yRhTKDT9NvMFUu
	 k5aUgasuvErEjBeg3aJ6KIY1GZFWieMaTzE9k4YW1OraoY//d5atTQghfYY+pnDBGeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tJaLAVE6Ohoawqw1sWmwjp5ssQaOa4RU7FxJu0FpFGg=;
	b=AElpmfcrlGClMONd+O7+32s4EEPO5v6vfPKYWl3nBTWZR/9fsO0WWKyrx4dVdydvaZk4
	 /e9uXdVn0VYNi6GMt9JB4l8U0Z1yRpVORl5FTlcwgrav+0t8pQ6Cw2BE2lXYOZ3ueLPfR
	 SZOLryur7jQg6fmPtwpk6jl68dm+vETrBd0gFaP0FZWSRnzufR9DBzMZos6gnl023HXQD
	 eZGzDd0vmnkGCQAcfdLpyJF2dkPQQoaNHW8XRGpI83KjL6wVA0PtusCk6juCV35JeoNts
	 Vuo85N6bwekrLCkimIrb2XewYs05TJLoocyEbb8tNCBExObo69suw0WQwucvcrYclDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NSaYD0am;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385E60A5BCD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F385E60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NSaYD0am
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-862aca1ed4dso632587a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795041469; x=1795646269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJaLAVE6Ohoawqw1sWmwjp5ssQaOa4RU7FxJu0FpFGg=;
        b=NSaYD0amCC9xOJya8NYVAj9n3XSKOoqUTENWt4VRsvNVnmTraEPawOt5CkiV5ZsoaJ
         wdnvUmqVRrorjdy6TL50yKU/SGahd/1LzlNIapGPZfII4KRkTYeACjLqv8ABI1LJi/o5
         LXjB13ROnt/6VYAYE9Eidx6qv0ohgNoPgBhuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795041469; x=1795646269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJaLAVE6Ohoawqw1sWmwjp5ssQaOa4RU7FxJu0FpFGg=;
        b=HEx2FAgrqE5Hbhy5qCCmAenXyLUs0TA6fklnxTOIX7NwyZvI1hFmnMheyTu28Y0yL2
         5AvPasDIUDTqxdqSMTERqmPltQ7iZxpzcOW4eqnd1KD298KpPSwIlmVoFIC/UO/vI6bk
         t2kjMa3f3byFz+AIOPShveu2pXl9Lr354lMKl+59wVInVHEbb1EorlHVmj/B/s8eWavr
         Ed7ErcXkyRyBja+2WPlTEALPiFkZ9AoE8+qQIF7MZITR5OLKo0VY9+D74XqTjVOAkFKq
         7pTV9RmReYGEyV4YtBJT1+DSL8E7qrmeM+9rzzR3IGuJPbJypXdX/ouRw5kc0ajV7Qbe
         3gUQ==
X-Gm-Message-State: APuU4Z9W3apmDCj0YRXqn6K47ieNFTKBqOT2rrrBktwhzJv4Ec5yvrHt
	ULUilZtWsdRyJSHYHW4U2J4hTzQzvWym1rGR/APH4zOSATAYndhkP/NB6t7lNDZ2yA==
X-Gm-Gg: AYBFou1DOiKm7uidtyt3NASWiE6GPWUg8+1K55c+2hDe9L1E/jUyjQhVTRqKZhH9JlR
	+EEgjPMGI650oMakJSQQf68KbRxlG1TKsdA7HwbmRnTY8KZ17REFATCBHobk+nkqxGtp3DVUDvS
	hIGFeg4Ly8NOJmlzgzhkPdjQmvS/H5ZnL2js4Qe0kLejVoUUBpOZa8/qSLkvLAzWx2U2dH06HP9
	KA4Eb4GSq1I+T6PqwC+gUSURZdaf5m3ucAmxzMf0WFXsW3n6JJ8L6IPXBzNHLz4rHmDP0AVdhvS
	uFrwCAwbw6Koz6PEAdlLlurlSwp2KGiTG8kYFexNeCW1lysfxap+O5LyklZAIlFMW55EBfmzOfV
	I2UY6ETipzHliTVLmp+SfMGGVVAFiCyaXzJyHEK511Ye4iDU3eKlKdYSswLf/J9wQCZkbeqY9gx
	JR5iWpY/v6e7OxPat8N9AnFxIOIoNr44nZOZMQyl33EiokeHm9JuE6LHVS2O1HDEsT8vEMkgIvk
	oqQQq/di2S5ZUJ2SXNrLTAB5tN5NDgepLnmkAGTSH5eoNmheWdPxbMrIcH8p8lM7A6wTLDI9vuI
	Si8Ta9SpQyWHlyGSIiV+sVHAawWI7HMX7pwbJm0xN5NV+3aCQ0fTfTx4urPJ0qPpxL6+8NR92aP
	4fHTZUmUtcEdnFOufG/V63dF9zpfNFIB+ibSY
X-Received: by 2002:a05:6830:4428:b0:862:8382:e0ba with SMTP id 46e09a7af769-862f08facb0mr4136749a34.9.1795041468917;
        Wed, 18 Nov 2026 14:37:48 -0800 (PST)
Received: from rrangel.c.googlers.com.com (212.56.236.23.bc.googleusercontent.com. [23.236.56.212])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d4737sm2948762a34.7.2026.11.18.14.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:37:48 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH 0/2] pstore/ram: Fix error-pointer cleanup and region bounds check wrap
Date: Wed, 18 Nov 2026 15:37:44 -0700
Message-ID: <20261118223746.2251358-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
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

This series fixes two buglets in fs/pstore/ram.c during ramoops probe:

  1. Clear *prz when persistent_ram_new() returns an ERR_PTR in
     ramoops_init_prz() so the fail_init teardown path does not pass an
     error pointer to persistent_ram_free().
  2. Check remaining region space ahead of the record_size division in
     ramoops_init_przs(), and subtract from cxt->size instead of adding
     to *paddr in both ramoops_init_przs() and ramoops_init_prz() so the
     bounds check cannot wrap.


Raul E Rangel (2):
  pstore/ram: Clear *prz on persistent_ram_new() failure
  pstore/ram: Fix region bounds check wrap

 fs/pstore/ram.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

