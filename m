Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100897;
	b=CJR+mxFmtf1bS4MHsq9SLR9hY3B7PWSNXRKtLOdBM9JFg0oy+2Q8pOUqGkrBChjNVTd9
	 1fXVg30wfftbTGSBVIWIZ4Xvz95xjluVb8Kv7biIvFe5Tqywwa4xMdBM05zGX7HqmeAQs
	 jD2kA6PCVSu/U7mCOYE8aAkGfhSq4Dh3Qze5WWmuMaBovqBJrrnhMsVSisMB6tTnNhnnM
	 g89FKAG+w35cktr793gcjDdmlnH0AW22rxZf9ybYbdMQEGcun8X3qBNNZvuTOYZZGQR8V
	 Y6PrWLolZd2O+7kmfiecpO/TpAJVeIAVY66hjVuNtX1hedNjCvbslz9x7DfyGV/5fZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=IhBsyxlFiMFOzIICuq4EAFWCKYTWxLwkuyTnkBUMWyW1QHuAoIx+dsKk1BomhU7HsRu+
	 njstuUXYSQA64mGz9bJNCJfq0UzWwrEQEXOu3Zl9e824O/i1RaGhV2Dcv4X+sZsZHsPdK
	 3KxiYkoLUauwKDqK9BSCbNbcTkYczJbGz8sBgpVqeEkKCV4rJ1HwE13h8zm5HiLbe9T0p
	 3JUNxr2hpn4JWOcGjHOdMTY9mq/KGk8OdlHpSWdTlJLCKy2yEi6Q68L4391iSSDZSSNTP
	 0QSnzuHTisgLOUh+mWFrNyYZJbcDfRMoW6e9o7PyPJsNd/oyaPg/9DqYFtxnI1RoLtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJCoBasc;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78684606A7DE
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78684606A7DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJCoBasc
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so6236017eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100896; x=1795705696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=MJCoBascf/JD6aYl009fafAxphMqfJEuwkk3KVhy+8xCRIxSNk7uvnlkI9V2Ykvubv
         J41RAVlhjAQe4phLfqrrMNqrQsAYSkM2YJKWgRHoviKwXN6NFRaed7qHOTsEVrOUg9F3
         gAXouEMBXI2GB6LGS53qbah0tjrrCbuDGMVlhqBt+VXuZYgcvldE0wOvvvvi9cuhNrjL
         So6btNB++z0Y421mkgaHeSkDMiO4O/Fj/KMlUK4tB36B6oxYquD0quw+Y7OkDIvHwoBl
         5kUE3RYYM/lLSwc8Wi42Yor7nXXC3j2bPJbj2p2o2ivO/CdO4+jYu6In0T0I2Y1iXITE
         M7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100896; x=1795705696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=AHCNFrFZZT7z7SStW/OhhVAyUI1K+l+FAtK709psHl+aONzRteJKbCQFdI8FQZlL8q
         FDd2qiQgL+Hx2y+iUkNHdIN0peot/8HzqvGCxMlGr+eT06RYr909zDv7pV+YStnWWvIr
         aPr0IdMzj+i8YMTz3tGfDoMDZIn5fbXuylX4D/7rWvXt85jW2k6eAhfc+2kWzHJCqrVv
         CTqbsR6YLJse+5NOuF7bVamPZBoeZYJsUa8U6rEC6/1qR4FWFE0rwo+CgPpKLCEkxhhP
         yIBBthc3EMrlP4lmacBMA7QACvs7EYx1GgF6X0o7snWwnWS5P3tVWMND8k0PI4MK/5+6
         OCVw==
X-Gm-Message-State: APuU4Z/o7YbCdsMh9tpgHQvm6nN8LUFG6JDJgbsWF94YoAEWBXvcgATP
	e9V9AULRNtqyBN5hC3l1HvFOXq9JUF16zozzbDFXrQ3Iywtwjmr3K2Zv
X-Gm-Gg: AZFdTZenTD94wMkLVmE6lv90ZcokKl8F+YBN+uztof0pECtNszoC2NvQIHuqQ4VSyFw
	dXMZmV+vHGcJQsNULzLpb6J0hvdJso+ZH5Xl2meF/AhXqmubLR2Og3D5ECWgDKhuc6XV2kvddZc
	x9nyoSQKFqP2Fr1vjmuT4XyJT9RonSiujSPKKdybZsMxppsySEqkovd528BXB26C2XFSoqmw5P5
	8iVsw8Wd9yC1TWCajhR4X7iCmu0zoZ8i6v+wR859maG+6RDeXtyhTWIPa8AZJMu82iMB9yqqANR
	/r0vpLNyuwS9XwqdSNAeoiD9d3RtZaZnBsEcYK+g6A6xqYqsWvMKWeoQFxNr8B/sp8ZkQIiDfbw
	HIssGVCi/7QcvuGZnfyLKwT+tK5qksEKgQq+BSjauSaWrvRtdrl+feTVXd8OE2svE9uUFBxzwdv
	VMymT78BEuPFxL+7V1igZaMaS20wuEJKftVBNN/X5GCzqMyaLn5vbAMDJZb7lWdlDz16wmgieVj
	ZQ4lDe8z1GAvMNawzn8IHyF+9xMsBR7HR4UHdrhj7I91wEMBCw1yazuUoto1uTHDq3HqrVzTZ2v
	zGvoq4B4Hch32MUd9ewKOFrADZ/VNRiRTbVj2DnzH8FlgH33/Dq3
X-Received: by 2002:a05:7301:6794:b0:384:ce59:5e1a with SMTP id 5a478bee46e88-384ce59897amr1818428eec.16.1795100896568;
        Thu, 19 Nov 2026 07:08:16 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm19845018eec.2.2026.11.19.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:16 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Thu, 19 Nov 2026 15:07:45 +0000
Message-ID: <20261119150745.3450-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzghugfm.wl-tiwai@suse.de>
References: <87qzghugfm.wl-tiwai@suse.de>
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
