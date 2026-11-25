Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615187;
	b=J1niAVi3l6u/BW9Jc1UcnV/RTLX2FNU6ia4UM9saIUzO8Ur04MjljW0AUM15Dow642aJ
	 qqq5NSod/mV+zJe88UwkGW9nX8Zvg17+nl0fUsmB+ufpltkCiIWQ3eJe92GKqm+UG/o0Y
	 TUJyzrgIdGO/DR1HIKycngxsnFd80FOcoeb7C40HUwrKxyP2LAZnaXxV0aPeqwj0raoTl
	 C+ZTUlmjBjUoK4hUwTqoi/Y5AibMO1J6P3ggG0NXjtTk0AS5TiEeLXUD5JtQevt6ZZzB5
	 yNQhSpDkbx1bD6MugCCxuyAvoFun2Mfgwv1ECSN4dB8ieg73xj6anMatLkTJiBUv86A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HeuBNRqTzgwYYrb57/RKEcp/iimloiD/bD7d7kpxQ1c=;
	b=ZLGAltZoWE5rTApMwKi46jJRAaVNatYzO/tw9dKNoT0GJHWqSyjii4HlAuBz4GNOx8sI
	 y4AA7BFtIDE0dxqUv0Hl1FREt/+sC286BYZHZbz8X8gHD4MheoX3A9enaF6+r2YTNMMZR
	 DFQKciwdxS9HpZY7lE0YHb6kDDeVaTYgC+kAiYkbXlXG82P9qKvx/ksHfyN+IsAuiDm9Z
	 n2HrmkPK/IZ9m4QHocE7MOZv4uE22PtPOELgYLckk9PMLz3QFudizlcWOF5zcrBkPDiqe
	 wBqzzSvIRg1vd3Ao9JwglytTnA5yV4GMPgjqlNRH9yzVKgvzKDdKe68WoW5z11/baMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERPy9TSE;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF05B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF05B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERPy9TSE
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so3011643a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615186; x=1796219986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeuBNRqTzgwYYrb57/RKEcp/iimloiD/bD7d7kpxQ1c=;
        b=ERPy9TSEv0TuqKEv2Wa0h7FjfyCXawyZ+6AWP+wVsxFGNxAESI0XR1bVeynwmn4o2E
         aYu2eGj/dwBbiDyBCw1iZNoqFILgu3lHWxqxnJFd67W0AAWlTnmAucII5wtRgRta4Bdv
         JUsVsUb5r0jQt5zQsu12O8fdcA2SM/iqsg7IhW1prJsUQTwYnnG6EUjpfoR69YRTkEgP
         WJzm25RYCp9RTAtQcJL+1VyhANPYu7ZCncBPT4vFyCiM6RT4ViPofL8FHmyif+yUUAmY
         eV2xiBu2rm6X4NbTiXSyk0pog84CywWVt7Z4b/jNE2droHDgrUZy0bItrKcMetMIwIgn
         eo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615186; x=1796219986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeuBNRqTzgwYYrb57/RKEcp/iimloiD/bD7d7kpxQ1c=;
        b=1obtDKLeZUcxAQoTaDgJTT4qJcIKTOLO2rRe6OnH6ApJdwaELliZEZYpyRmagxij/a
         OJWrne415V+zjv6ZRNjUFyYorOqupIedk8nL5HJz6JnwWMz7Fzo60+P8S6a8ONpgUsVz
         RFRGR6Tx3QNnKzqe1+gl2fnu4bcUk4flM2rqvi5qNe6hwvtOzBlDEZcGG7hAemexc/i1
         K/HrAYGIDTyRkD0cgDOtqgnZGh6cEgIslwmKEcVB/zcyWrtcDoa1Rjz1H2Jv0wSSmgDX
         qfDXjVg9iTlhhj1DQ6hV2m/K4UWLEmj6rPn952ZHDGTyQVLo9GDdyotOks97bowRUpoj
         8wuw==
X-Forwarded-Encrypted: i=1; AL+hErH4rKREncEn2zG4TLodH2I43U/LVq3CQ49xfQTd9s8Se9c6gF89hcmaT8Qt9NoOmWbzTg7cG93DTXsCOI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/abNDrUzVu7PmsGv1/utLaqKXVMkf99PNmFyAHAYcTGI/8akpE
	bJnQfsDLvZVG0sKKK1QlHFLHTAobFfdIfg1GUgNffqO8vYnKhmdIdtw+
X-Gm-Gg: AZFdTZcQbVeIS06KgOR+KYD6oZTDaGxYHulLo1qHCmS5ZNPivIC7mxZKT47H6IH5Gx7
	JL/x23nRVh9VsRKZ8I7CPOdkc2FzUdgw73OWicQTFPu7vobY0Bv09Hblf4DdU+bkxhF9ZaeHkmC
	t0hz8Q0JDjMHhtjYoIcotqwbe2+lYw0bAMMt/18roZjATs3Jnfm+l89aL5x4AmcchhW8JQ1AT6A
	n/24R4bbyh+P5M8IdWHeS3SnVKhmlApCoS4CJgchgcFaW6JetF542GsJoX5YRCAqh4yKwVcJCOG
	phwGSuL3xKW+mXBs5xvfysev69BRXUBU6EWYgkf2YO0kHrSxnqgChb9t7Klf2SDFU22nRWUnxAi
	baA9TiqTYM6QhuaBaAXdbxUV/eiZa4ZPPempGN5VPhaEaQ1cCFuUtMapX2yPh0dfH5IESc1vjma
	Pbiznb4SR3aQm8XDKXZFJzBmA7GgV0WDcQh4gBuT35WCq/yE9KYhDMzYz4YiaMhLhQIRcr995Tp
	oWIpxNA/QQZvB/nOnuDTx2GVqvWNSxKIAtqQ8JaWCEl33aVzqZ/g5CYt/SS+fiOiCCqW4dPj095
	NdtGTyLwc2oJhRDe+Mn/0VsGDPeCNvg+NBM6RIWzzvWsEQ==
X-Received: by 2002:a17:90b:3e81:b0:3b3:fd13:683d with SMTP id 98e67ed59e1d1-3b41cb1bc6dmr13472060a91.55.1795615186187;
        Wed, 25 Nov 2026 05:59:46 -0800 (PST)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm9143860a12.2.2026.11.25.05.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:59:45 -0800 (PST)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 0/2] Bluetooth: L2CAP: Validate responses and serialize security changes
Date: Wed, 25 Nov 2026 21:59:37 +0800
Message-Id: <pm-bluetooth-objects-candidate-0069-v11-7d5800a0c21420dddac0-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Channel operations must refer to the intended live channel state.
Match Configuration Responses to the outstanding local request before
applying their options, and hold the connection serializer while a socket
security change uses its fixed SMP child.

Cen Zhang (2):
  Bluetooth: L2CAP: Match configuration responses to channel requests
  Bluetooth: L2CAP: Serialize BT_SECURITY with connection teardown

 net/bluetooth/l2cap_core.c |  50 +++++++++---
 net/bluetooth/l2cap_sock.c | 158 +++++++++++++++++++++----------------
 2 files changed, 126 insertions(+), 82 deletions(-)

---
