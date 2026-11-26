Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674119;
	b=YFHinqZwKh0f3gO+K3ZfwCiXyxAKL690q4YdOHjR58ihvXOvgK8TX2KYXAxqIXEeBjWb
	 ymLIW+rA/FagmG5D859EYDBorwtQ2V2fIFOPu7Luv/HxBb77bGWPOLZFRB7RtyqKor7Ls
	 yAp3vwrYPLEQ077xYKPuA5ZUfqNeWZnqGDP3MeSMMEbY98NwmqLFk7ULUb68R0PkTA6aA
	 3pBp0Epvni2i0XrrpH4+SKbPlKD4YXuY40tLpei6yEgxmcYgkfZjuDUtAsXcgw7SKK/Yj
	 a4B+JNzUiUmGOQs+i7ZUNx6MThLOWkQRDTajLHVkrdaUdjDiHkNcP/3KTnc1T1KeChg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=cdgZQAkZhrXwvcb+VqvyB/2fuaDb1Ml5P8sVRL0r0oJUza3xF6I5AArisS6W3j56yEoV
	 9wCMdW8hiFw6BJAbiMyb0WauR1xXona8t/q8Hyz+zgFh/KWBNyGb6zVjQvRlvT7PvV8jr
	 9uuhEDUW6nCxTJ3DHscYn1oRxVmB8MMvj8iD7Y1VZAxOtgI2zedHSTUWqUdy0uuqlME/N
	 WaySftpn/5r0bFm87NATKkE0M5h20TzwkxA7lSU8XxDpDuotH9+UPtnHbNl5oCacu3QOL
	 qq2qvpt+rzUZAhH1pUENnw/JJ6TxDgtjT4YyU0YWVEgZcqhzHy6pZxPQm4Duv99ewnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBOlt0Sh;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761B606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A761B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBOlt0Sh
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so11039803c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674118; x=1796278918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=TBOlt0ShMJI3wfTq9QyENhtp1fWb6gsfF9AX4VrIonYzM+1uOvRyRcGDixBZP/S4+q
         rLYfOkj3zTL36J2bjepOuoPZJhxy1XP3Kq+BOZ9aKvqSSHqnDIxTESAhHXre7ol3Hmbj
         LZrZyTfac8O5eMy44jE68kojUrpTWPPivMK4pEp1Sn/zf6KrYM4Knyc9FuF3CRusOSn5
         OQtz0XmEiY/1ek2vEcjOnkd5f/pfKTklwgd7Kkn+k0u7dvxrV7+A+bFyUNxv2aDuK44f
         jsceiAo36ZYurkLvke4Fj573mS0buslNAu4JVeNg/+3vikRPxfxYeDzec1oAqtZI92BA
         h+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674118; x=1796278918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=vqghnNu4orelG2lrDiKNbiW2vAj1OT3orspejQemtLovKrZyhyRQkbD7lc9IlbzGDG
         vGhCjO15HRRop8AfKhZeo/x6Th++YO1OpS1aMBvX0DcuZkT2oQBYeyJf4kla+RrS5gzB
         Z/DjiIc+YCXswnYR+tBI1rhPA/0Ca3XbK6/S+ILJCQ6uBaGy2cHZ3AJ9E3dSZzfZ7lrc
         2euTJw7xxSQ8+aaS2+IzRGcP4fqgC61MFiXq7L8+I1HXYqv2nKmIzErxZObgGkLzLtH6
         oq97rSlMYKyVxyXLAe8WXVGAqTvHS7BONkWLVdE89dfMLv2DS8ZXIuhCaUvcE64dAoUs
         9Y/g==
X-Gm-Message-State: APuU4Z8MDxcQshap+gS0Kr2T5j8k2fw8JfD+rweH/d33CtPk+fMeH61R
	juL0xk443ZyymIY5JbyXuCeAut2i3hPt9ac/aCXU3prGH5YbW5bf4sYoFiK0gw==
X-Gm-Gg: AZFdTZf8h/F9eJAvA/TgtUrS3bIX//RlFsRJYenEzW4+KxNUlWlShhc3xHsdNOWBrIS
	qZTRk8TAafWZDMfp15Z6KPTBsuI5HzrS/CBIPOXZMmqjcP244x4wTgPkUFMueqg11M7GGOkLtLt
	cplgyEfNBhbHr0eJMrqS6m2NmZSEvJyQc8OfGnlKflhjJWuzoKdmaq/I9Swepa7TDbkWnROF/of
	tZyMi2KVYicWR6uDqlAy7GhhQMSws3VxYhCFcwG81LxFloVyMiMuCei0FrN9/JNXk2rUEF2mEc6
	wd95bZL4djay7ZVt0x6l7w2n0giPHP+F3qr2znSJrbWrTl8ly9F1lPx9plxr3AHqnR+J5c666gQ
	QYuAwRGquDTh0YzPI6nUzNShUXratpzwdsLBWpjJOqhPvrmGNRLJ4n6c5DYbBYzdTWrU816nXN9
	fsgeuyhRr44DAODIx0FPUtgUJ+I8e7X3PpMkhm2wz6E3YGt6y4i+Y+k77b77yHj/NanVv8q6594
	OWahQl+/KIRcPwu2jOFfsojC/Az8ZhC0/20Wv+j2MJbkFgbM0ou5rSByvSClvSel71MnOz9RYLC
	qPWlXOsf7k0EI96E8Q09QXEkkTMjtsNhPUj8V+SYoGm+JDTaHL8=
X-Received: by 2002:a05:7300:89:b0:386:c880:19b1 with SMTP id 5a478bee46e88-386c880248emr6128397eec.10.1795674117868;
        Wed, 25 Nov 2026 22:21:57 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm61262563eec.6.2026.11.25.22.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:21:57 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v4] ALSA: core: Reject zero major number
Date: Thu, 26 Nov 2026 06:21:32 +0000
Message-ID: <20261126062132.2905-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87zeux6nkz.wl-tiwai@suse.de>
References: <87zeux6nkz.wl-tiwai@suse.de>
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
