Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186746;
	b=FjWKe7fFPyzEMg6M8loEQDjOVtgucPh/FucBSvBWX1VvIux2iT8uFvqjgOgVqpNUOhwL
	 XLjnbFjdA9cn85DpKISuB1Do+z+yeYS43OlOVU38v2qkUBkdqHqVcbLu4S83kJbSWPKrm
	 JJDbbG906ay4AFGsZG36zsC16Kg4w2P5b9bjHjlCRaKeh/NQ2AcXYvidUxvbmd9hwCPjp
	 3LsyymOR/03JU+nxqEznkkQz1YOJGXvVRm6x8gjX2Tztw/wK2BmRm2qWmBepMYYqbhlBW
	 8UOvVq1EsjmK1I2zUi2q2GZpNVI0DhctXxi1XczhK0a0ihjAaFKXNcj7Ra6f36ZDlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=P3+7kBc081Vb4cFjGkwTtYJDJuy5LT0yIQH3AyIZp88=;
	b=KX9Mkw3S15hhZF8bXdpHBnFJT5PLpiEfQ+vst9//hyVIAPPKoeWBiGN8nc/XpxDzR2ww
	 mk+GSHvXQ5dGh+irBWotVPnGFq7RB5NIlp1XP/aSQBsUzFisjX+PjCIQd57XXL8y1nndK
	 lzBmYAmsAUHYNPpa8tmtCUQ3arRB+YYaPlI/NYL4yJ0omYSfO2L77klQVcbEmc26mcHoE
	 m9MEKetsXyzeNWuKiabVtIpOBIHIwhimMuYhXHmPrbChKzFHTcZReBKF8/6cxXUDpcXKW
	 OhsGEFL9Uv4eehL7WHK9RoiQ2QaVpb8q59i1+++NkXCxyrxQDAPJzPDdRB3XqKPoOTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eJJD4wsO;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037460A2601
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B037460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eJJD4wsO
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so553672b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186745; x=1795791545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3+7kBc081Vb4cFjGkwTtYJDJuy5LT0yIQH3AyIZp88=;
        b=eJJD4wsO0Ec4QZ/aDiwrjB0qES+bQiQ/peNT7hxVoQQJkapQO7cfTmI3WdpLc/rPAW
         vxlKSgqa4rgzMh1fXi+s7bsxYgiWJDAIXIkyHZWw0u/IxQO8iiAHpHQCrfpDrpBb86DQ
         TDnzQrwsihZ2OIhSk7iQLnsc3wu66u6msI6yhjdpFMS6m3PfFftvccP/fAyp9NkMLNcX
         16LmFFTgURk383Vz3JsPgD1kxXTl47yp3kfZvFA8sE0XBq4xWQwgQ/ayWMafFuDYe4L+
         /6+SMHkHSuRD2E3NGGMf7GyvrWpTQpnpb5yyiUmO0S7O4uRyoC1ss78KTnA+2XkAliRu
         /jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186745; x=1795791545;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3+7kBc081Vb4cFjGkwTtYJDJuy5LT0yIQH3AyIZp88=;
        b=KfeKKZ21X78ejrGvS0VPBTDfwASQnyqFspO5GBmlBLi/bBym+wGglI0uq6tqA2u4SY
         CQPLrzpaObtmCJMuWBRB6P1D3HNFKT2vzC2Kceb+CYvGbMWAu62sJga71sGonvOwbfEk
         1+jeBOl6jkCKASitc9onSGrlxZTLEbWvh9fmhvOVFbT3Tb/d8/0eCU8qGFzsT3JCwuuz
         ttSlRo5/1YY3xPjyzdz+uJB9tISLhI0OaEXgLN8C6otUdJPKA8ViLFPgZpoe5u8rjeXD
         wBth7AkhHo8+sCkFTK6xpV+EgJXcN5BPZTMblQPllvigT2ZCCsKVOR8KkeYdFexZ8dl5
         uGAw==
X-Forwarded-Encrypted: i=1; AL+hErEl7sSHG1BLEaUTmQpbN6/mvtIg1oJJAA/IPPjC553sdFdD4ULBV92Cp1z/iZu9KAIIqK9sFp+DAuaJ+xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R+H5G1XLHLgxWu24kywOtrgCLsjeHvn4JXdMVJL/nvA/Oyy3A
	8iZEBkCndl7oDjEA+/ei8RtySeCAYAXiyXrUi591BU3dEkbAS3+kJkPKap68Fj3Hgss=
X-Gm-Gg: AYBFou2tlsy6VQBZemdjtnO0y42uVPSx/CJh74hK04Vxvv/se9seoXo1J/xUfAWn3L9
	f8gYb9roIdZqOEbzQc7qz2wbvPjCl2X1E/b6lUL/RcszSiV7+408EG63OlfurqJU4rV8CuACUXQ
	XbDNrIRwgQpp0k7tpxtd75BXTgZMY0oeGIv65reJ8dHTz35sAdVsAaib7gYSXnvOpN08ml0lmj6
	kFzA3jm7gsYhxtol4jtJ9kEdPTfWe2XqOrJf3rNGluA1uXg5Y1q+WfTwkNCku23sxH19RE4Mdu/
	ZEYfDcp+ADqrgwohV0bz4G7OeeVWa31zWhdcx0lfV3PQtuDemUjE76AzmKgEwKBX4KmHfS/bffx
	NJkK10LmK0S3X6Sdeg/ztTTqoPCJ2l00KAxmJlQjP7kc26VvSAivr1VcxYTSBv3YIGv/67MT30n
	55oU87AnGSO5QN/79ydOZtXxc0vaY7n60676pyf5mRcMneyKhZjlQ4Xl+JkEUPtpX9+BsR16d5e
	MAteWcR7dBhyacw35cWRFSOHj7eiUH/qoculuHqljV1JCFNT276zuQEmWJnU5iA4WpWMuZxJYLj
	bt3AHXAF0TizKtLe8IcKOLmEdwPRf9QmlGdb0UTDjBtdYoLLEP4Qufb0jHexze1yVHWe5gVMj/u
	IvEFSjg5lHeyisJ3oVtFK18+uTCUA1nb/L5GA0E0Rx2dQ2mQFeiKaBTIUqA==
X-Received: by 2002:a05:6a00:1d8e:b0:8a0:7c97:52a1 with SMTP id d2e1a72fcca58-8c87d124d3cmr3133566b3a.48.1795186745028;
        Fri, 20 Nov 2026 06:59:05 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm1647354b3a.28.2026.11.20.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:04 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 23:58:59 +0900
Message-ID: <20261120145859.3127816-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007070207.666738-1-yhlee@isslab.korea.ac.kr>
References: <20261007070207.666738-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Oct 07, 2026 at 04:02:06PM +0900, Yehyeong Lee wrote:
> A target can finish a read without sending the data.  iscsi_tcp_data_in()
> bounds each Data-In PDU against the command buffer but never adds them up,
> so a completion that declares no underflow is believed and the command
> ends with DID_OK.  The pages keep whatever they held.

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
