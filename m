Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512480;
	b=APa4t1Ga/d4CXVV+BtpkiUSJad2juMSsg4CGk8+HA+xyJHopKa4ChlDluXA9bm5A8gb6
	 h4HwJesqeDGdARwq2O2P1gttmc1bpuCQ8da+jRFdl12bmMIVIE/7SmLegQg+e0+tvZCZA
	 po510zL6hzi+p4WKlRos/E83cGk3V85EYv9ixUoWoWi4LuPdMmHSQqKGVwMbpkr2BraPW
	 tOhZImzXI6eC0fX0rH8JvpA1kHGRapVBz5FTjyxmdkNOljff9Y99G8xzGmmGIJa/a/XLN
	 AH2EBWPM28yUayZWq5Fz+iKNVBc1NlwA5olfReZsrcsbx8P1xyIB+1DzPI8s1Ttj1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TWHNEL++1iAc8xuUz6pXGuwhXqWb9DFmAWCQn+tw8lw=;
	b=IBtgEeYlPPUnps9L/X3/aVjR53aa2/JMaRZUI1TCgS3emfrGqYsn3KC2O6RUi4CwPdT9
	 CR8VdgZkiNTeUMeIyjsFteoH1VS7PH0iDWHlqJf3cnaD3L+KJoRx3/naMcCohpHsUFtuh
	 F5vqHNrDKYdvRMGgr1AIXATRS6qthE7w/ZVbmIy03yvE9cRH+ROqJrTQTPuexiihSuilh
	 AxfbdaTLhJVjj14OpKEUEvKBb5UIh7/1mL9u4zqt94deX3R5gk6bdgYKZDVzH7AuiVCEX
	 mcS09qzrNdMkt+EYhzClm9juBG/AQV6tpUpvBmWUowTHlGGWDqsH7PwfvKsM2V4LITg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krel1Mzw;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3686C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=krel1Mzw
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so3891488f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512478; x=1796117278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWHNEL++1iAc8xuUz6pXGuwhXqWb9DFmAWCQn+tw8lw=;
        b=krel1MzwQ3o6GDc3R5qx13RZMJumZpXH71QSH9vKpM4ufGRROwg4GKcKX8zyAU+HDX
         VRbV/kH5LLlV+nvXM4vrtEzzo7Ov1LVJFAhLv7bBXYCO8CSes0mEDk7XHgXhdwfksL8K
         5B7IwQLkSP6eTVemubwDyuJ/vyxFoc3IP+Vv3rEjH8unDPKal0eUPU31zvhqEsgecik7
         zD1aYd6+nEtwP3kQmcf990YHSRzAGVkL/Gm4iCtgSp5EJYidKtpGjk4u9/chThQrkmZZ
         a7srxP8YmRef3Rzn1Oa6hzwEsrslsw1A35VkQQHVbUiCE5MyS285TWd2YdelhQlFObR5
         grKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512478; x=1796117278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TWHNEL++1iAc8xuUz6pXGuwhXqWb9DFmAWCQn+tw8lw=;
        b=0r5pgsAk2R0Qx4ZINgt6u0Va2/CdE/IR0YOayKctuz/sabQ79IrReKEVQDcUVTOhM4
         PUBIzSLcfMp8S2tdv59vwYpVNQ1Y4bjcn8i938lPoX7IWuzHa9pnY7wQNp7fUuh4AVlu
         4mv3FxYvvVOv38+MTZIbnQcGWQfVHQXkTG/yAs+TWiBvHwN3s6GbtI/dE/Rz8oLKJwTp
         mX6vr0OcmqTf/JxvePkEABNLFMp7HcZ0mElRAo3bjF5wUhjmUOeVA9r/tXeXIPZlJZ4K
         0quFFixRmOAJft7dCDUt3p7BiptFYwew1XYdaHpcSVgbUaGFXm/T+TTm0LqOM1+d+Xbb
         Ulbg==
X-Forwarded-Encrypted: i=1; AL+hErG3GOyorDGK9HiuIjWhPH/Jrn0uMaxcN7fM5IPRBlN/VoViaBm85k0qKoL96tbxOYrwhwwYRp8ESHhT1vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dr1tHDVIa/n8TeoaV8Q2/mABdgwl7oWuR/3ay74f6xoDLHvxJ
	OkJjv/ADRsLmKKAH/tRxo11bWttv6N3ED9SmSh+MnTHqIq07zC+4w25E
X-Gm-Gg: AZFdTZeoA/nax59Q1vfq60wivGFzzLzykfoUHbACHySri+xWO4MoedGYhSJ/p04tR7h
	AcmbARBp6d1KZFr0y5wBQG0yAlANTT9kcjqfHhkqOeR/nZP8B5UwtyA3UUAnlFAAGZebMgi3Uf1
	eLER3JdfyJqAnuTbAujQhJnAkH1ANPkP0WgiRwPuVtt3Ju7aD9wGJyQK8SD+AhfCMYqDql3+vyJ
	vt/le6UAw2CrRAA+zBW0HLFe2w5qK+u7FA8Fbo1Tk5pmTVHlrpBllpd6fLVMdaP6HD0IF2T+k66
	RZ8+wp+hkOViw5RS3+qX7sp97bH/K3Q64mb+QiUx6AGZHZo0E3ajbenrYkWgy7g69SZ4nvNl2CE
	XXk5LALE2wVPy5EN4QP8EL/6VnIbpCgnxeBK4CwCN8n6b86+Mo3Y1nAfb4cD0FzMaBbqO67aIcb
	r4ZKJQcJn7qvaqwO3Xe/eWMri6Ma8pnK3McJ7h/Pj3TlxZ/UZFrj05erJKnz37qpZ6QxuD5x7lE
	QvuP3Ec/AJrKTom1o1+RA6VbxND9dbajpVP03nmLIN8a+xjNLBIrIR3QNz1hCDyeCFk/OJrXyep
	hWGTEPrj3yMjLeI0WJJssL4ENk8vWrXSMU8=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr27082941f8f.51.1795512478103;
        Tue, 24 Nov 2026 01:27:58 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm26445202f8f.20.2026.11.24.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:27:57 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Tue, 24 Nov 2026 10:27:56 +0100
Message-ID: <20261124092756.211244-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <243260ca062b40ba965eece69e5c52f7@realtek.com>
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

Hi Ping-Ke,

> You can decide if they are necessary. As I mention in another patch in
> the same patchset. If you think that is rare case, just reply your
> opinion, and let it go.

Then I will let them go. Both are rare: a failed download was only seen
in unbind and crash tests, and the AP stop needs an AP and an associated
station on one RTL8822C. The same holds for the minimum interval in
3/3, as hostapd uses 100 TU by default.

Mehmet
