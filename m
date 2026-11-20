Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174457;
	b=NDdMIMZLQY2J7QPXKWhG2LgUSphPJUyRJpfHOlKkkxopJye5XrokghRK+beFrO1+1/27
	 XBpYo0tzVdABTr5rd+vFPsDkbc8MzW20ePbMpt5rEX7eYrYef9AgnEbWOfHeSW0sYRp1P
	 0YnxeFdd47HufEDlVax/Kpb2NKQcJX1TnPIsBVFNRQ//IkBka709goA3HWtAYBZxZ1W5Y
	 k3tVAvXixDygX55dfsJ2FsXzuVtCLIHyavLVj6u0S2SN7Qf6fWndgqq3gjQfBJAdD2bcG
	 R7cCKq+qR+3hqZSYi1xLn2wa6CtE89aWuW33yL/IdHL27ED50diJD2tZlrnToMfFC4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=cU48Hqbu0uwFqHaPkK7t4WwmrM3WP5wNOdwTgK9DgHn8dZOF7KBu0ER7oncFK9Wezp17
	 tyqIyXaA0KRIJd0nUCPgHv4kvOT1XHOB+2/jNO5AntXtM4B6LuWIkUX/9l6U61xY2tDBg
	 yV0nb3Waqk6fVmDLcSHWgMOXPf8TJPXwh2NH70K7nJtyAGxO3cI/wvORl0s9XcdJWcvB/
	 rGj/bD24WiLEBtwBmWPVzDgnY3HAxYfc2cEdrA9AJGOLplwh2WNcQCFAQEGesUuRYeIIe
	 6JhTEFS9ARpW0xiLiBL+C5EOafvLM9M0i7AWGYVmRPPoh9aeHxuvlpr13MtUG+JY4Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DIc6sQdh;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E4C606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E4C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DIc6sQdh
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so506038a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174457; x=1795779257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=DIc6sQdhoZDPF1oyrHBgIwAwhZPAIRAL8eGHMpk5qP89FFgKp1tR6BkAnF+hMY9T4f
         PyNHTZJJwDtHG1ybaDoDrltuNhrHabjdkQTAoZYt6xnQ116XTSYSI7X2LVz0nGOmP5So
         CMHFJrk9kTVCkC9TPhtS+JeYksO+a4v8Ffu9PvL5UN0Y0hA7gtTp3qf5QH7NR3eWjnBF
         aOWW/RcQnIohHINE2XXl0RU9fpICmw9jme6+zHEDO0GM/17kck4pI4+8oNLF5qw0Upc8
         wvuKutXj13KzgOsn2B8HcBmWqXhqbsnF8CpvAc1eSycvPEMsucdFfkXcPCh19pte95N2
         rmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174457; x=1795779257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=NC4m7JFHPLI3Depvvw9UFUwtk0L3lFud80yBWFvWVVim6H+cDjdSUndFqJh3+1M0TI
         0IFxCUGy8PhhXXtBXefguSmZcx7ZHnJgZ7FRGcpVu4yJ6d5Ae2IwQDzDolbkYi1/SH/6
         6xp/KbPi/PzE+HuBdocsrPOBbp/JzFqM6ElD3MXnGulbvJceax4IC0QDlP51cVA1LjXO
         enEMVNbpJqnxTOytKTHEcmNlSgH3zapLp7fvU7qko/yWPCW/F6zX8yJvb1Z7By64+vM4
         8rBQriA23P5Mfri9hrqoT0gtkDHH2m0LZ017RKfmuN63RZTvuf/qEqS+Acp1j90LL3Rq
         qsMw==
X-Forwarded-Encrypted: i=1; AL+hErEbBxW2kQwKlOJjCiVtSvY70Ls5V3/a9EZQeQEbG9YBHjiimMdQn4BcLuUcPjPiC6C/dX2Z2dBP2lzKF5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BMvgR0IR/qaUY782kiK2q2UpY9HNyRwuT6iZqLfkR0d146sGr
	26yNAKGcLfdwlgMWr9/Zpk8Z+jsSJd2MLOIGyJGoAUkw+bXGYMIhGg1GzqCf80Rpx5Q=
X-Gm-Gg: AZFdTZcUkgH6Oi3KrEPsK3UlHSjo784p1XfLpLWfvttMJVQW7TH4twen2k4Zyos01/8
	H59ah19AnBH11FHr4F6vb52gaofiLvD4r+W2xVu7MLXOFNj/HxYt9mMnDvVY4Q/3XG6pwwXVX5t
	I+Utq2FN0kLqRQxb1U8bAHpmUTniTmX1YfxoA2hi/mAXNZKCbDK4L4RWKYi1In2hqOWaqOKUrgT
	1bvx3xkEpUZZCPwpt5LFK8QSeVB0DfBuG5ewnJRd4BONnt5kwW0Wqrb0UGCLF3vt+oKDHUd6Sca
	O1qyjxey6DucUuapwTV/4xtyr3nQbxMinGpOt0gAjyGRHvwgaBq/KdmivO2wXCnlHxkHUfcLrrB
	K17sMr/NTSSMHzkpGI0Jz20a2LlyRB/ACoC/NUnX5wnGG0/85TnmIVBeQX27akFqJjjEljdenXX
	mHTbGakQOyT9CSsGo+R9nAzIyyzvGHS2h67CPChw8o3N/M5mh12fmbz4FAVR06DBXkoaX2me/uz
	NNqh8az9jAvmtI7OwcfDEEcpwVSm42Lxs2W0KTu/ScGR2wBGxLYip542VHSEnAnsFx1MqarEZgU
	2t9GczSHP/R1sEcfXTMBK2TD1sTgOlUkXwIf+H4eE1NwtdFcSZDBoup5M+GWz0LrTcExdl1jZFi
	fL35wSRmftS0YEbL2TWcGUT1auKb9M6asJgqQ
X-Received: by 2002:a17:90b:3b84:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b41c97c897mr2571898a91.66.1795174456775;
        Fri, 20 Nov 2026 03:34:16 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22aaeesm1455309a91.3.2026.11.20.03.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:16 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:34:11 +0900
Message-ID: <20261120113411.3069169-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
References: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
