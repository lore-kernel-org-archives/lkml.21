Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186758;
	b=pFt505G37PZw0nESm0O2iWw7VWN6XsvApGvL8P1M18t9fJUp/4TJVFMEgc/r9xUPVPeZ
	 sdVrbg9qvo4b1TofXQS7x1XlIBeXXqAt8fGGAWu+7uMOC6jHl6ICUei5LMWMC3JK+v5uj
	 SAoWSM+hV3PYcCU5Y/I+gu8rBALor1Jzlm4ONWpxqUncovQ0hE2BNIPd9JTVGsjKb9fVV
	 Tp5vNeLQ5jyhrYO8gbbMdvhmL7hgk4Wb2U1GSgTQeoUKHhM0W0LIVmrmmPH3vwTBBdcBu
	 QFQnmma/K2BHpZ7McTGhFa2BRMejwXiMlDi/5ewtNP95EbPEz1CS7F/F9sW1k8oBiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=swYxzWf5VVARgWiORetPyRqONCj9VdpGStrv3wX4KxU=;
	b=zZ8guoVgYwOWcn5PTP0bkOzDW3tgFSrhq4SpllfMD6dkgJhqzMyDrrep6FrPTNM0qTGR
	 znaeD4NBJf2oyQjcWFyXXax+hWmQX4kHs7WYdTViW0PBF59O5fvbh6iupeZKe+sRxgGS2
	 FRIIRMnsTVjKvzZlI4Mghriije3MRWB9TeC90iVNzB6Wana+ZYLBeCOrwJIfkFjhmxggp
	 whGZdsWM+DdwC5/ItrAtmzzNYUHCDy2ZEfxTjQevNNwnacI5SNHJdMwzCvwt+GI96wF/M
	 bJyTAvhvxu4rIum5ceJhSXTBGCIoBCHq0eXocX+F0rahAD7bwDp/e2+7wNkgvrHHFsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kEnxlnIA;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D260A2603
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02D260A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kEnxlnIA
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f046b0adc0so3786095ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186758; x=1795791558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=swYxzWf5VVARgWiORetPyRqONCj9VdpGStrv3wX4KxU=;
        b=kEnxlnIA11QPdxy0xiNbjI6WmXRz927tNWoUoSR0Dqr3zS9xINUl7tQYwDqtFs4MFt
         YqvUMTg9rhTVQFalZhNbws7euOL2qa4+1r44/m3MvVfXc7Da4ZoZlEXdy2o3ZVQydQhT
         3zfDpv5DuJjpWpKzKI9qYM9Ah+POJWywuB2bLm5jzz30E0BDXd++/6sr8d8WZpZc/+Nm
         o8MqC/0WDUDlk8m8HG+aU7s1I7K6vQVgFPYIWBHHqp+QjAys0BzcwAcgh5nWVqjqzi0K
         loLaERpCb6nZDJDiS3nqRbCfyipcMuuNrkc/SXt8gIv/+od3tTxpm4erpjJXX0Pduwox
         L5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186758; x=1795791558;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swYxzWf5VVARgWiORetPyRqONCj9VdpGStrv3wX4KxU=;
        b=YK89GcfnXTpVYNtDvg7cMhnnvN6hZqgs4x0XhGcjgHFGXSBJclftaTEHwc7hm81A7V
         eB6Wrc69c+je2W6SkHUrEPiIsAnP29TzcTcqhEaXl6/bMJUZVjlhWddNn9iVkcettNkr
         1fIY7iRfhV3iNzYO9nJQ0QZdJz2UXAe3NAoIpSLfLsq43Ag5T1xCU7c6o0/CkSvIfRn2
         pq3nIhF5H1fFfvEFgH+yyhBisP4S4sWWWuWM4AYi4JZVg2+jzkGu9VcrbztpnxvzULPP
         0EH7SUf5eIKgUDS1Vb26ARATyTP5b3OgnvWOPmxNUJnRgw/0sDHoPppHJaWhuVxU9NMQ
         +56A==
X-Forwarded-Encrypted: i=1; AL+hErH47we6oHax702dPvxK9wanAeVEtz2O2yLWPH3Tpx9PqlpLVA7kB73WgKWdGAPchGPxGcyVfJ/tAJFrazs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wpqkjYFhIhSZAtymPa0DFF8JAHUNkOFvrKGBwoftILtOHHnPg
	jy3Aqa/p15VysfxVmoQVSxI/Jn46OXCrUEj6g5QHv+QswZNuQHWqx1RUynax8Zz00Ac=
X-Gm-Gg: AZFdTZfG+YPJzd4IKZMIYmK3Qqb3dX5vOkg6Vlc9uWixwFh2HdegfYgIPdPWydElLoW
	se6irc3OdTK1/OyJ0pxUXQpSuxLhFZKQoSSbfehIZNpAckS6rvs1DarmY0jrGb5FZCA1PkqTC6b
	Ug7oDv6MriE/4WPYmIIjgMx8mDnKP18GHrFWzZlVbeYRDmFVEhyLyoDZQC5EqiI3h8NQ+Q2QLOH
	8y8D/HjJojGeNMBVk3Odz0hF6PbIZkxZaHhL10orDTrQQQWmsHCpyRYQw8KmQEN5lB700W6hfJv
	f38kP7+yqS7b53Z5624d4ibWu73S/7tlinhTmxedC8hL/bU71Dscz+887fcfx7BbXOHAvQnX8ii
	l0GRV+MOkui34MfCw7svHf76Ys3dEJToZuvKvz66B+YLT5wD3mtCZHcW+wPl7eCJ9aoI4iolC5p
	Jl9zqCIJe2yaq02Nn0fq1F/u75fw2fSLP+vcDIWTDaIy8Xz9eDYC06/KgQqWAxf+jy2NB3s2xDu
	1m9tfKJ79sy5tpZzmVrYVi1P5G4LZUp3566ii/ADoBZ8TfYf5NhBzspWAhTFx/yY0/TC+DItIv0
	H2KJ7N71YihTFgfABQfe8G76qgtu+BoKD0XfKrcMYMR7LQ+YvRcVAvu0pF9jtf7dnHbqzGPwKvY
	LvKPMhLOD+ayE/bqY20YVQU/f2zKI2x4O1VWa
X-Received: by 2002:a17:903:94b:b0:2f0:3618:f170 with SMTP id d9443c01a7336-2f03f1acb10mr31323285ad.66.1795186757992;
        Fri, 20 Nov 2026 06:59:17 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1058fesm15977965ad.48.2026.11.20.06.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:17 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alexanderduyck@fb.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	kernel-team@meta.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	daskald@meta.com,
	mohsin.bashr@gmail.com,
	bobbyeshleman@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] eth: fbnic: validate the Rx completion buffer index
Date: Fri, 20 Nov 2026 23:59:11 +0900
Message-ID: <20261120145911.3127855-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
References: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
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

On Sat, Oct 10, 2026 at 02:53:58AM +0900, Yehyeong Lee wrote:
> The buffer ID in an address/length Rx completion descriptor is a 16 bit
> field, FBNIC_RCD_AL_BUFF_PAGE_MASK being DESC_GENMASK(15, 0) once the
> fragment bits are removed, so the device can name any index from 0 to
> 65535.  fbnic_pkt_prepare() and fbnic_add_rx_frag() feed that value
> straight into fbnic_page_pool_get_head() and fbnic_page_pool_get_data(),
> which use it to subscript qt->sub0.rx_buf[] and qt->sub1.rx_buf[].

This is superseded by v3:
  https://lore.kernel.org/all/cover.1791775409.git.yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
