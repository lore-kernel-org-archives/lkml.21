Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186751;
	b=SvlqQrV3VUVSIYOPIVl7UvsFBg46cSbvRl7zQRNf9KZALPZmAweXdDAyV8mfjLV/H/Sj
	 /6Bkke/s75X+cXvESzPZvnX9CYBDioMsv18uZWHCGFVaHnHH3emnjzu5aO+rAdVcimd/S
	 ue4yZz6ws7GqpQVM97wGF9KF+tr2j4Sl4I6fkmUTgBYpHOpXnoUOgnYu43EwNjDfJua1h
	 fvERkWG0KuCc2YMjkArGgweUvKM9uJncMzXIgXqDaMtGFHDXiRw2vdftiVvEV6+rT4/K/
	 PpDCTDuHM6hPJRn8QyC9tNvByvyXiOD0NtGc4Cd1aHdGBx+hQI5fcDesN7HuH0ahKFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pMe2S28PksslU2TATwAXSQ7xt5SHC+8MLW5NfFejHd8=;
	b=yt/Y1d/e832ICL9oamcOlvbETUUVQ2JvdcxL92EubscTmDUfjzDSqu9AsUHYn30XbvJP
	 FrQBZSdgD84p3eXDFDJ0nfLW7lWk6xj1sz6jr3hE5gg+74bbz8IsdPpYwh2coXCrPxE/N
	 C/5YZs+xOlPIqP9xQdzAb8kBfYKHZbdXLfqXCxySU7nRs4HL3NiXTcvkqqYvgLQrsfyme
	 KdPN8pgjahvthhaW8syQHCXQlFsMramI57k9uVTfS9gDVIeVHM/UOZmxQofMmzwaqsxaR
	 FkfN2qnkVijE0LAYsU5U2R/SbMT6TDu1FenCmhl31qPO6pjkEO6TNvSYL53G9DoKw6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C6v9ihqd;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849760A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2849760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C6v9ihqd
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02ee04378so7732785ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186750; x=1795791550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMe2S28PksslU2TATwAXSQ7xt5SHC+8MLW5NfFejHd8=;
        b=C6v9ihqdT9v5rMTejN/oj4JCfpRVIyJYlpBGuA4jfdxOYpcEuR599DnDOtaf8US0+r
         m8zuIq3lUsM5l10wrfYVw9YIDqLRL5d0lFXI4BHmMV0Tf3RmYGcaroO2t1R+4S0nJTf3
         Xu+teZ87Q2dfhZTmgl2VpRySiOwfRmxcqCA9s3q5M/jxJ3TvdILUdvybKO7kxLd07ht2
         AOuTUP+tNWR/pveAo8LVPr1IpvbgZztVXn+DGvjSaUgY7Kv1t2+K5hx4tbLYyZpzGEIO
         1f6ZG4tKheJdPd5BofGkDcZz5ZFz2iOftsYRzW3LNmd4a8wTEJsLnkfL6Tz8Dd12rDZ0
         6o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186750; x=1795791550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMe2S28PksslU2TATwAXSQ7xt5SHC+8MLW5NfFejHd8=;
        b=xNmx8JM4EEqvrC558SV8NsKwKve8Njq3oX01GYOObgTEMeuNzsvO6JGe1bmQIMWlXv
         D2NV53y5gGNboi98S5n4XoIYbyVSAuLR3lni2By3ytAbwV4lySCX0LkujJsGA8/Ob9TJ
         G9VfOtSFOBy3/vE8+2x2UPYGTv2dV3/2koxG5h+r9CtVDgZvFkvsY5b6+BdCp5JKWHe8
         T/ugOcvC5Fd8IbPkEeqwkzvEx+X27tVRXVtyTYOlfoKUfhRYa84Es4jyxTNZT7SAIY+m
         QkGs4SRV/jg82mJaO1GYnEfzMYqbeFpfBRDNt3PbS+KLQYsGE2qc2HfBqVlzSEJWBaiw
         eXyg==
X-Forwarded-Encrypted: i=1; AL+hErGjunjZQWByfdOhMDaBZx+9+FEUWst2tXzTJ2SBlnDggFCDqE+yabyEURW9L38maLs8++ECFLycZ4f3dNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cjIbybAUZIp3J7tLMRZhbdsE+5lzJ/jWpSneoGnoQ4sikC27b
	tyhNLVySDuSfk6hGQdFntByPLOwlBzXX9EKAmek+eDPD8W5wXS27hiUr6e0vroDk11Y=
X-Gm-Gg: AZFdTZecukLkkhiHISA1B+vCl86obDDPHINPVnqkeVSutKxK2LKrriTxFH+/hR6vN4e
	DFvPhIRSaAbIsS9DmAtaAT4gyQsB3o0zuepc+hh6WRtqa/J2ZBLc9Zv7wBomy3IdrT+Kb91SL4V
	M945ulPvE7awyazpwGkjMpLfJed8tqZFJbvLLLtAqIxsTXZMORmWIo1j3GcU/YxXq7J9oPClat1
	bjDBmWWp7R/AaBUvhxiYEwDNHFhfUaE9rHkwzNvTKYY/X51tQThSFiR34/iVizYs159qeVB+1XK
	9bhezywJJn7oCZkqOKNNoARvIVySJoHSOCvEmMHCISXm1mfBdkJzSk2R3nL2QZsKCnlzpa2lO0I
	dWcoR428CWck7Jn4h5eGiG8vnfmCa3VVbssj2PEKtTvOdgQI1FxlTpbEoPc3Gjd3IvSzVTdTU40
	/IA3toUenfc/jwYujYu1JqhZTTwHgbYLdb+adOrZtBEjDHdPZ3t9PwRX0aafXMXBnmnMVB4mfr0
	rmefr5tEQ5F9aSwHQXSD3ypMod8vDMbzjk/Nh8MjsvRb9Qn4sVfGtsRUKwmG/ry5/AJX32NkQLD
	0XLzFhfQIGFKuQVpd1szwEuYTm+10IjO9awx7MGRfeWmfEAhdVoNe5hjPsKfi+Obx4W1mp8dlI1
	UZIuCkxaJNkeB+RKi/GqpU1AkOeYoxzofZ7e+
X-Received: by 2002:a17:903:2285:b0:2f0:41c7:9a40 with SMTP id d9443c01a7336-2f041c7b268mr32731505ad.4.1795186750654;
        Fri, 20 Nov 2026 06:59:10 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm16171165ad.5.2026.11.20.06.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:10 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] scsi: libiscsi_tcp: zero the unsent part of a short read
Date: Fri, 20 Nov 2026 23:59:05 +0900
Message-ID: <20261120145905.3127833-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008040129.747538-1-yhlee@isslab.korea.ac.kr>
References: <20261008040129.747538-1-yhlee@isslab.korea.ac.kr>
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

On Thu, Oct 08, 2026 at 01:01:29PM +0900, Yehyeong Lee wrote:
> A target can finish a read without sending the data.  iscsi_tcp_data_in()
> bounds each Data-In PDU against the command buffer but never adds them up,
> so a completion that declares no underflow is believed and the command
> ends with DID_OK.  The pages keep whatever they held.

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
