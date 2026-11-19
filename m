Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100568;
	b=ThpIrnyvTf/26bH5Eu87uZXICCZKI4JnOFTDLh2gFt8AMBm873jYbpx6Gy9NKHBoj5Kh
	 Tilg2dO0SIcDmz+wBCCWHrWoqQ09br3oIPzWCu3mb4xpH0QGy0ur/6dLjneY6fzQS4vtU
	 o3jMDXa5eLt723H1dv9xNn8dmSk7IypJngW5KQYkNd5THD8/2j0BpUGwu/apBdnOLDLVl
	 bXLza186NB6LyVYIbWOJX17rbEu5WXez3CJ0Vz9IroJFdb5V3r46ewwgoQkyZYx2B1/xE
	 uWL6XqhjsegzISiT+nynlRsSoc/KwcZ4eCDm6rluogFKEQkaOOxbjinNYZgxBFQoGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=k+FG0RBGFUn1XbL537uMBR2YCZmdRzQtMIRJVWGzNdHlh1WPpIyivcrHFZ3FjrqdtY3e
	 z1PVneIrsbdctckplPmh8Y0+9vlUZwZLlzyAuuNZL1fNxTwP1PYoLxG9JDsLWseV6KuB7
	 xS6Nzbu05/4sHYh7LgDc29EHujEVtUt7b6ZV9BTsnUXJrk9TUTGCVTh8bKAA9f90jKTIh
	 JAhjh2i243k9W8qBJBaaaTWVLjpIj694DEXKudGKT22lWAUJ/0TYDunIs/59Zlr84Xb6j
	 Kss47C97w0O5zrVGVao9+a1lKa85Gqm8ftyZK53B4urPLVQ+xfXys1/u9IMhlJAJ5+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oz2nPTHk;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486F606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D486F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oz2nPTHk
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3ada81853so2659615c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100567; x=1795705367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=Oz2nPTHktLmcnwc9QD2deglhss/KTTh6sqOt3i2IxfVDH2uZsLDxqArn+5JT2shlwN
         PnnB1juWrf0rQ5RuxUhCYGuTzVH6pCEPT6r1hHpDa8nmYQaXH9l1GlT86Ot3/Lch+RhI
         P6Q0ZsZcA9G9kg9f1vkwokCYZIMSvnfEy6IJNowmsgGZOXbHmNWPu9o6b5oV8JGh2ePw
         xfKYPmKqvORFqIhWEUynLV0QDp1UR2zW7cMidypqiHYXa7ETzUaWYv1JV40nOyBxeXh6
         shAA+RtTnx461Ib6+e+ydoOf32YAMGYqOx84DcAC48LNcbwGEKLy3LFLWoLDdvWzGKKr
         lDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100567; x=1795705367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=Zsyym1MAMQorrc5dtDDUXjLt/GcgStN4o4QYxzOeJ8sqnZzvZoJZ34hvlm46VyKf9L
         J8yqowsfnLhBCR7VbhYfqtOLU069jeYeggLIsOnItNH/L0T2LhenB4eXiCkTzmAt0iC/
         qQGYQWAqh1fB8n1sQWfPU2fmZDJz6iJWdEfjebDu9tB9UkoOSQLY4RWv8XYRGkA4YnBs
         4jjyqpbtLWBXxUgBP8AiCmt0dhSkbjacHnebSNuHhKAeW36/v6Uv1rsZo778D6eSrMAg
         JtHSWD8mj3zYjsG67k5GmKKpb5QTPyFBmyzIgm/UJXURIJ4sM7+Gb/xYr24B7ld9ARCw
         bmTQ==
X-Gm-Message-State: APuU4Z+e0ZLMLFiu7kZmaVxKykvQ4CUR00kXIbI2GmcL4Q3G6314HL+N
	GX6xMc9qTxxYJluHXlO/asGp6/HVVc0/NqhxIh+DwY95Xq0Gc/sIwGy4
X-Gm-Gg: AYBFou2YvSnTLE+2vX+WOX3QHgdKrM32SKNjzQvF/CEQC2souXAyG9zsKng5jALXF9r
	DSjYhcE4gXLii1OScxYkeRrTVHn6wzqsYIZkETPTdA23/QF8UjabNcDAxp0QrQ4UUOnPpRmknP/
	p9vISTeCCT0HH374WDlphVXrjh8LmoXSTBtpmq+MMYGuD7NmuHUnUDsRUZpTFbC5uqEdP7n9EkO
	j/M8Ht0rqgqM8DTvKq/GJy3ayyts9EBeLNAoGx8fSQH0j/Fiz71w3it64YPgtphtwoGc+SdXU2O
	L4GVWcqniGsiYX/YYZbOy3Akud2XSJZwOStNIPqnfsCRBz1eF6PrfE4nxsdOS24TcNjZX1/bSb4
	Pp4h7yE7vfDRr03SeX4Hl9vvtEDdMzxcntwk6ZG8wvYVnZHPkFpbq+YzhuP7yRUD7ayMLf+ym7X
	ki5qUljDSraug6uUsnHOk+oMkYd1imI0iKkyfWjx/cuyMrOpxB2Q3kld7/Muc3jQhp5+Yo0VSgC
	VQZLImXozuSGKAglVVhV5Cz0fg58V/yLntiMfboBhRseytOEnHS7syjaG4qTPaV/0hnjOpriNtO
	IfF4HzDxZ+VNoszkkBsIqqJw3/I3G4fwj6CLNZ1AJbvUhrf7GQXW
X-Received: by 2002:a05:701b:2051:10b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b543cf29c7mr5755024c88.31.1795100566769;
        Thu, 19 Nov 2026 07:02:46 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm10457288c88.15.2026.11.19.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:02:46 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: memalloc: Fix DMA allocation retry cleanup
Date: Thu, 19 Nov 2026 15:02:20 +0000
Message-ID: <20261119150220.3320-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87tslduhiv.wl-tiwai@suse.de>
References: <87tslduhiv.wl-tiwai@suse.de>
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
