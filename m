Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264350;
	b=LYTQQNo7yZojlxP6ajgSb2aSpDK6uI+oM+MyrexZgGqy+Q2TFhwujApcG7cCRLQ6+nTV
	 WEnrQmZOc/4PImyUI4XlkvjhFupvqHzoCWnNopjEAxX6W38tVFPWk99li1QK9aRvUWxY9
	 EuA3HOdeOIeHOSASyMaus3uIr3tqtQZzT2TqpSatFGhprw/SN9QlZ9v9iLr8ZuiucduTW
	 ogveKLBqOpKOFZaZCL8v7ox08u4WGSAaTeSDqOeqheCcF5SHRbueZg0Ai2nryt/qfFO/U
	 2pfnOKYK+K85dv4b+60YpcFomakXKa8O4dUvGmzT7RSb9cWwMHrJJ0dSBsm7jt2hERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=H1uA8ILCsrmVUG3PUzOaIs6346Bov4gDh7oeZxB2iNIp+GDj/yLFlRMLUn5kYLdvR5hm
	 ar1EYcFDFwMcijCB1tLQT4mZHGWqAeKmPSwvcFJ72O59Qmvio0+sFTY8EtKcqSZ39rFj1
	 Wsu5KWsgu6ejskQ44KdaQUTUOLi3OyVamFhlLaalnKZplpyV7ewL+btB0OB3QA4ihbbEX
	 Ae64S82sxH7q1f7RVaFdOPHGyb5/WIun+g1XVMj3NyyukF1YvHwik0h4CxpRzup3+GC5D
	 UV6SiGGwynyjh9/67w6JXxzcoiMJGrR8xHeT1k8M/54cYFiPgfIk0UR+GhZNnwpu35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zidJU8XG;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D9606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zidJU8XG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38699cf08dfso914254eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264349; x=1795869149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=zidJU8XGwlInRgNFlDnHbYyvZQg7juUChuYfGxr8zXEJWMtYfa+jaG4vlUgks8DuPT
         8FXKl9esRTfhgrwEphHK5FYuLiNo4NhvGkfezTv8ZNMH3xScboO84/TETFVMlsHKrpf/
         i2blFZW3pKgpg98kYFvedNLTgI/2/442Pwuir0dBEKQidrI+ajivm5gKoiab7RDUOTeQ
         z9tVkK9HU8t425JBPx9hz39vnfBhOgJFRE4mhPTXtqUEbO++F2ps2j0ixBAfwEEWmRqN
         bzPEovXYWN9RjN0E89khgqcwyZSgZMPI03I/aLehnrStBQr/yllBdMMoFg6NVBKpng95
         RuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264349; x=1795869149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=CUyIrF73dJa3MS7rWiozxU51HygnbQMaD97J9n4n47iPo2H6QMwqMB/oTf2A6riqKT
         rV1QTomt/t+Pwblv5Fm4B76SQjhPJKJmOj3RnDfRZsHuv1a63P35ELWpdOBL8exde0fT
         3G4YTb9XOnu37EiA5Hux0cf4V1wLINMI/eLLufni38gGDu2IcdOkmr2Rge8qqqwSWocl
         vHNmvI0np4VtPaMADzJGhPU7BXS80+w3TfTYc1oCWX8Svp0X9cfwPTTR5po8MGJFozwe
         dKJCbkEpONnInCEXiaKLJZf7nCH8t8naMw323AgeeuHxEKNM8Y38vvd8yufMBjhShVtT
         omRw==
X-Gm-Message-State: APuU4Z+jNfhF19oIY6AOP9XFsRq9te1DnLuP2h5Cv1p5ABQ2NJ6zByk/
	aBRJ+seI7ta2IOxqjEvaGceoZMOaU+NDlIqi4gdX3Ym21ljGJP3vni/boUFzcxw6
X-Gm-Gg: AZFdTZfq+RpGZL+ErD5HTKEkuFy2IpsiogYjz/XXFQagIbGjeUmk76AO/cuXyHWI4bN
	pegz28dtMgUg3hnsNuYBFa5VFJqUmYmUyyBtpIi3ANYRhFAaQaZpwgiEYErQC87SjmTlRYtogR7
	wYMpn7fKYwexqGMhK8IHOVo703QlSZ+HOy0+7HnobOBy0TDtbnrVaZF0hoZB50olf+fNWxwSFWz
	ryQe1LIwfpbEeqvN6YctOUgnv/d4mpUtACgv0XqDBvtp+Dzh3QYrPpz9Zlvi8BMVvpwKH2noS/V
	Cb3DDygFmQ/HMlzUYLNA5kTG/I1OxWERiYIbMrrJUgiy8ei1usV3hZFhIPmG4Ttu5iuJvCgwCFW
	2BDBjL5CiVd4QezX9oZ5dRJEIZs9sUhVAhIlTZWt8Y5z/P3QExpUS7wjV4MgQGZHhwaxOy4FCH8
	0ANodK1JvUwVYA1rnI9qTpBta5XqVVuh4PXa0G/pVSgCD+yBh+u/sPHlySmhOg+XLsugf6aCR0L
	ReXI33VxLJ5sQmTfaZpRceymV+fh1E2vTifPLKPJpgeu2L92GZbuO8PbpQvDO0bsRKBliqkU9Iq
	M0GdTgi3w1kqgdJalZMBW2DVLgpb6dgly7SoaXnJFeMA73pkOAM=
X-Received: by 2002:a05:7301:dd83:b0:386:5adb:ac29 with SMTP id 5a478bee46e88-3865adbb03fmr3662487eec.7.1795264349132;
        Sat, 21 Nov 2026 04:32:29 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm16506569eec.29.2026.11.21.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:32:28 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Fix incorrect numerator selection in snd_interval_ratden()
Date: Sat, 21 Nov 2026 12:32:05 +0000
Message-ID: <20261121123205.2574-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87a4n3wi2a.wl-tiwai@suse.de>
References: <87a4n3wi2a.wl-tiwai@suse.de>
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
