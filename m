Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175034;
	b=o6U9sI0WtQ9+0eN9j0wivBoUFOB5Emk2SuIMG3YZOKA+ytokg6ZSOCzL5sKmWmzGgYku
	 7nfxV+C6lyjz52n/3Y6UJiRzJwPQGQuHEyfhnAacaKaVd5DWiNAKuHREqe955sEX6Sj0L
	 PaMCa5qG+3RbGXJIXgeP0EjJqGf7yz2EPPXC9IAQdyAEM2WsL2owJtheFj1bzQqkNhuSn
	 dZkwRcrOdnozAmTRRex94BoEoZz3y51xmooP0WTyyL5MXWT1gLf4TwbRbfrfyRb4jhhe7
	 FQJj/yxAsQ65jxfAD7kNeMyeMfCRnCpxFmrr5K7iCEPO7ULqVpV/GTUPmTcpVjfeO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=dYSlPGcFQ1/3uKdvscIcS9gpPGzpS2ov4Z/324FaxMH4TqZ7U7UIG0fWAHEIMJ8bJuga
	 h/G4faCmpdEYJay6mxPmkBIrH0rH9FDnk0AnR095wXYyFaPCQkIKKjvqPVHyXv2kz3co4
	 4l0XYBn7Cko8KT16wjoPB9YNVksP4c+3x1v5ZBUDnTxPHwMvt/4P0J3X6FgVgzMVPh/VD
	 FVpRmFOY2nTIamwxdw02HxwP636F4ZrZ+VUUMPEZWwetKdKzBRFyd3t7AGO1lOyFXQqj5
	 UPpOraD8/nJWf9j/jE3s1GlGohnofioGkFZ6+qkYT5cP3MKjylM3fTaAIBD+szZpdcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CBHtOKrZ;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E77C606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E77C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CBHtOKrZ
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so395924a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175033; x=1795779833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=CBHtOKrZRyOZQ4x3vdWvUDHPd8uBb7gOvMzo3ESEYY66ItUOkqljSL8DaYyjuR7bZ+
         Oi6ROgg4CXMGtOqsO5irktwdbvEPpP4TV814fyIoncQEBDA7gP539xL01WNBEw8eTP3T
         RijWJiyFAcjR7ADfMvhpmRUIatmiT3/VsfBdATneunc42NXnGnuJJMTumIjYQUW7jr66
         IQFo2tDe6NGBymG9BcbGyo0FpGcc6/BllWytU1EclPjnXfKP4tlzNt62CM0CNPLNW0M9
         aJE012BKx6iLuIIWutE8E/92l0MS2hJoLcRO52m3SpPPVAReZaZ/Bstm+Eh+0I8mLiX/
         dCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175033; x=1795779833;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=Q02BUROtpWkQ0pdn7+bROMg+DGfC51Tbr9CPV3om2U0ecVv16US/Jpz2z+vsXj1S/+
         9f3KtBktSB4lpj6QMgvAQcChDgRcuAYpfbIzkdTIpcdegQJC/nzGsuu9nWc9ROZWjQVH
         eHr+ckO8CrzvIMpp99vDe0Vet5oRwbORig8HJdZjZ4C/Efih4l1lfxKc6lIG9blDerIM
         Ynndvn6eLWi6ouMurZaJTcezcFToDZRzTPD/9PA4jbRiMTdt/H6jRhxAptUwxC+kZJBi
         uwS2FdbrgxD068+mSB/lue3zAAg7HrjQ3tFu8L4AB8ndPOduPk//1jp1AqMAwYp7eCEw
         2RLg==
X-Forwarded-Encrypted: i=1; AL+hErFHugbDDR+eE+Tnb39zg+Be0LYvpZ26Q37PAdJo69AxHm0IVn08e0jkxGzK0Y+ptRJbAeqVXTgjZsM2tJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vn09/UnSrkh4c4MQYz5kTlzNfCF9MNs7U9HAvupIWKFZa2yZp
	U2r3GvgPifr/EzUUNiqoKAMHE7yqe+vUWRlh0VTdL7C5E45PjXzaV43u3N2LxxwqVEE=
X-Gm-Gg: AZFdTZfLCvKeUuaf3pvIfJ3P1PbONgW4Qo8O034AtJJ2RGOPOWMnqpSiCYzfQ8TA0Xd
	LrP8VAheODulHwkMa2XS8UR2s267hVPF9eh/RGuTeRa58xQSzO+a6CnmaODAf6E+nrEiZ09yaR1
	CAcgizpgIIBxo8D7cPCBAvdU6XETkSxf+x1WtHlV3bsJssXHWtJh7rQkYaDWUCnot0fiAxPIQcr
	SeQFoyRKevYFZlQVUlMR7ny/wsN5sLmhmb58fWRnIAPEAlvIVS17m95gq356dUQqUaGM9x7DlGM
	BxrHQi34Q9Kg3WI/xE7bX9U4WcEViGzBUeYHHJW4CZSetAJqCLnKktDL0DIoxRXEljPS6XEqu7B
	u1pOx1SMTITIe/Gjjnsay3Uqf369wS5194ilMhpgW66wl4NUuWTUYs8ZD7bms6Al0GcBdVrULco
	oUF2uOM3avqA8wdxkF5sATSkE/sW2wAWLBE2bjviLPwKXFcY1hHzX+uhwjq+wIQrzICajDkzvj6
	cqhfZTqjXCspoqJCRXf0z62GhSsP8rai9NbEr0ogyUjSV6UnEZTZEfpX9ta54PR/vlSTnMnD6ir
	zPSzSrLbhVgz3N+nECRKmvrBQto7vDcf2Rxgvmq12SRH9ZLTdU2EmsXIf4ZZ6t/nqzOJYtYyQM/
	/66Y35WN/ySiKYZINlY4O8nsO7kRKjHmI3PcU
X-Received: by 2002:a17:90b:3d92:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b41c55a4aemr2773111a91.0.1795175033553;
        Fri, 20 Nov 2026 03:43:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm7306025a91.10.2026.11.20.03.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:43:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] scsi: mvumi: reject handshake sizes that overflow the list allocations
Date: Fri, 20 Nov 2026 20:43:49 +0900
Message-ID: <20261120114349.3072404-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014021919.3486362-1-yhlee@isslab.korea.ac.kr>
References: <20261014021919.3486362-1-yhlee@isslab.korea.ac.kr>
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
