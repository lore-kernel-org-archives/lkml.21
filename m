Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175029;
	b=IK3TRV8k2i4SKzU2uN+PV3h7rxI5ApgX6J9M1ndfD4FOx6cl+WGXzLUBIaVpNCSX/pYY
	 uAwIQ2QNQft0rNe5gzjoNf/W+zEmPGLLm0qSMI6CphhJc2TJPiCddVKsFSolPkxh4qKE0
	 xkOuw+PCaf7CIWfAtOACMFz702dejfn0slX4/S3CPxKfYDN5Q++alfhk5xyhNwJQJ6p2G
	 9OFXA96LtT4tMn7/jT0CxudY/+mLgSIBPTYsd0mo6QKC46VcfLniKHRZzF35vuDN0dxRA
	 iwn72p2z96QWjC3E3AGo6JZWSc9BKHIQYqY78Ll6CrjrXE0sUq8Q/Gnrz4p7K9wtj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=GEU+EnS1QYAxqupwLXYwRgwC93ZUXqLzpmrw3K1tWQ5FitrsYRdWUDfCZxZrEUk75Jaa
	 fI3icZ8u5QH8EE8PRNxuX7F++0ot7zN0DatunQT2TryBrcnb/2YQWHEAr4XQPFn87B5x6
	 QpkHX1Kh2/Pt9rKxpg9G8XW8hDEKiTGBns770TodbMlpA9Cjm3wLypOXC8Ws04h1T0WPs
	 mkn2cq9PTcB0HCvbA/cP6wPHospa5a6FDh3/F98pCEJ3ncknGRT6jtKLGL4Iu8TIOvHtn
	 z8Beit01mf1jbjcThJvdvb7igsSRXPYZ08R4m9sXPH6YOkJay/42w4sO+uVlQQDfKBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NhGzSQH1;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0BA606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0BA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NhGzSQH1
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9d7791b00so6891435ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175029; x=1795779829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=NhGzSQH17nlkip71WNTcEZpTyjedR8LT3OnINR8pSSeE+WblknToxWy7eEPd1aF7Is
         JJieRX2de+cMdswykyCZhJMxE3Xj77YPpAB5+AnT8jc17E/HFb3m/xwNBSFxdIL7q97B
         4exlPXoZK5qpAYSB2TogNlqyNQPiLxqn+DseLSI+KyPQljFY+ADTUtq4phVs6lOZBc3J
         PD7PbDCjC8lHlch9xm6WO8Rpi87a8J63ZiTtnvU/xwHt7Hhk28kEkkRlAmow0hBXjGWH
         07ybTGkNfBt4AHhUyGlY9kVnXHZ9n1BS2ElZH9kVeOpuhYkenpva8yxHF5Jw9QFtR3vA
         C80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175029; x=1795779829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=rZGkzDU1xQqdz/Tr1j17qXSjBnm05aHsBda7nqACV8BA24o6Gfd54Ol0o/Y4ROHtmM
         p5OAdSxS8ccZoZTotdlptpLi8S/O9rvcVkRWaouOqeamRDuZxw6Ej4ABgfX3m2Pc8jZt
         518rseizoMlRtrAS/7vU3dKCQvTIXrlve6TBUHKqE5CCWaiyuFtSvmoKHN7qSv9rrwu3
         QYqRfCNxZprc6jOkyu286OdZr1r/efWsmG0nUVu5NUnINrttA1c2rQDM0FLCHg4KqjIn
         9uCXxx63j7Hrzizl+sxx5mITHIHj+0Vrf9hZyRRAFKuQ9e6LYxcKA6a0k2B3JCkOyDcp
         6qag==
X-Forwarded-Encrypted: i=1; AL+hErE2hKFV8Ib/l01uJ2W6A/9Gzd7NXk1fQNcduzbuGi58k1OWeJ3UaHHfOVQQTGIUJmoTyhFwbOrlQ0xXQ2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HqvlMUi4MC6hWlTzxfEiuEJxsTJW2bTAdx2kt0sGGiFbkiu9h
	a/ShFNPMUsOMhPA3f60dAt5i0nIvANHqKKPoNtUzC9R3z494bOW+IqMOl79wJAAyNCs=
X-Gm-Gg: AZFdTZeyfHX3OEi0Llyg0VclH99mZALZzWXsum1s6zxnI+rVGlQONfQnE3QFk5nYqh8
	TMo/HUo/IsFJ5a4b7kChKLDwzYuPh3Iy8FCqrTadCmi+Ivsnza1pRE8nYXn5XradTZcu7MOKyu+
	8SBj8Sfi3Sd/zFHW09IdYxLpcpYMJ0vwgl0VUfWunWjPIl7sdcSkhfPiIumRrbpAe4uolALcvhz
	SyLlopH85E06s58tR2b6CdClJH2ZIHeZXMEgYZx42jQID3J6eeosBpvO2GkMQVJv/O/QxXvYzNj
	Bg6SnhbMJkUOVtFMYwrmsZywKcN/Ix1HIG91UlNJxVYp+cu3AmdOhekfXyPqaHADdCMl4GalPrI
	eLEZ2euY3+KcX2LRU5drp/sQYrX2q2hZS4n1NHUUUE3eMsFKpmZpJSm5+AIoC9pJ4ChBnYBl2mq
	SFt9BDdn5nTcnb0qjT25XZmXCYYZwy+XQ2fPAg4/VlRopBBfi6aHgxcPhgl7uENIPFY8M6fioUW
	ytt1gZfsFsRUgHNW5EGphu363PG12cqKnDMCkUw12kGWSUzh5/PCrkaCMWxSum1S6REy29MtK54
	y16C2e1g7zktLvKRPE4dMoJ8c9jef9ML45ov7pNJj8nhWTRzy2sG/6csJnO8UIdHq6cfBlqkSY/
	ncVQdgv1r/Wud0lywWfj7tarzhAZ+uQtevDksWJ2mcPBfD3R4hCcxji7T9w==
X-Received: by 2002:a17:903:1a68:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2f03f16993emr29169075ad.39.1795175028725;
        Fri, 20 Nov 2026 03:43:48 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm12953215ad.3.2026.11.20.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:48 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Fri, 20 Nov 2026 20:43:44 +0900
Message-ID: <20261120114344.3072390-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014011808.3479480-1-yhlee@isslab.korea.ac.kr>
References: <20261014011808.3479480-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
