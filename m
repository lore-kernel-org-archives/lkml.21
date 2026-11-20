Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186734;
	b=3bGoiSLExnpIVKzHV6YZCKrWRcf9dO2bvp6jvnPy2NnL9nPBi0N7UX3WGmhoLplZtDsz
	 z864LsFrIu27Q9FpBFNGpkIHjw77g5wYiz6twdnR13WBjNga5JfwvRvjX73dbYXGLjXU8
	 q6/1NCGKAJgX5CgHcIgr3ZD1KEWIP14iB8m8A8zriGgz0RdqJCqXCZsf0AkDq9SzUX4XE
	 ceSMSnm2AaboGOtBGHwmZOD33bpsfCSngjmCuo48yAh9ddwkF9dmVYBVXKgWbzmamELnL
	 revOHS9mQJGxsQjgax9FfBQU+pL2jh41DooxbsNr3OAlRqRba8hQshKqK9JFeYhRZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KxUI+6qDcU/AIs3Dad66GtLz3B3FQt8+aPt35cEovds=;
	b=CGzruxQb6qw3FuVworxxdsZfea2Y2BrkjuWF+tUqqpJSZfC4y1uxRuZnAaEBL7B+Wzl/
	 kCpVFiItFOjxsA68o+/XGp7eHHOL1bbml9prnLjakqknn6X7vLx+LMSWvsp5ZnHCt6eYQ
	 ajtyAfcNqaciNbdAf8Nof5WqzKgLux1eYofoyRknBoIuT1NRLzTCP7aL3Qk3u2QJvY55j
	 B9LcfZ8D+HSfuTygS5YCHqGsLPE4XvZgF0GZFJmlWAp33WJtnHD9mvG0RVES/KJgFeTYi
	 E7YTvF5Do7TWjwTKjxpAIjEtGgXfuaHdAZjo3gZnasnl3dPcEVHYwWgcEiKwvi4pxBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i+kXuQkI;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EA660A5BD4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EA660A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i+kXuQkI
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cddee4abc57so304884a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186733; x=1795791533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KxUI+6qDcU/AIs3Dad66GtLz3B3FQt8+aPt35cEovds=;
        b=i+kXuQkIkmc56lUIKyk2laxSD5gua7u3A69PGl8QAPGRz1fk+04B3Vb2GjygFot/MY
         XOTod9/JffQqO4T3b0ZtY6g35M66OLOZKzYbvsMDTS+R+dmNQ40BmvP6vwXcfUzqjPJA
         5OOLzHwflZN4iojhZcCYgwAKbpqic3DbJpRojugBpJBkaRg5ytUt4jw3pOISG7T5wPvs
         5vQn9OFDRBjhcpaRfXrUW5RWpYfex8xBgCjWM6wcnEclzfpZAGndY6DcyT6abRsXpGvZ
         XkPMCoAJodWq50WN884qHKKNXMJlvwfqtr7ko69ipZtFdcbDYxAdEURQijQkT6R36Mc7
         f2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186733; x=1795791533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxUI+6qDcU/AIs3Dad66GtLz3B3FQt8+aPt35cEovds=;
        b=kem1mwBjyzUKEFy0hg5Zv7Wi4KsULauDmErI0X7D/gWA/SQJM+YJFUAyKf2vcHRqWe
         z+c+fpvGG8FOkzanh2atqAxJl/S4RCCWM5bbmqbYb/qBDcOvz1t/JtczPQC4qdWDjPXK
         8DeDu1mev9uoUkKP5EL8oFn7upkOWdHspmhdf31N9eDJ1g5cpiokpA64Q/xQITlJBDtw
         26IiyhjgxcrTclxG4+rl1VP/rRJIrEP8eq4J1HK/gwGac4651sMC9JESF9bVUyPQSU1/
         AIRvaHLF1uCuAel5ZdzN+7z7vJUCqK8Z4GcK6xkIEkagscKl8uUOasSLug/opuSLTWg6
         /vFA==
X-Forwarded-Encrypted: i=1; AL+hErE12JdaXEbATruY6WEjM2ybchNaBmfteu0/U3fB8fvZ0zphdLx9TKoyc6O7ia5aQsFU7De97lKfp63nvyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/xZh4NGAfWKEAAXyUqeSbxENJDRwSU349ReRrC9IAJY9ghPZY
	zOkhf9o9xYP0eyuUpSyfFBZtolHuV7dfBhsLW0iFf5X2RdlCIRPgqzdNMZWTfBq0FTYAQh8iZLb
	D7k2by1w=
X-Gm-Gg: AZFdTZdVysXlhAr+riP799tuDfYI1Pti33RfjB9+XyX22Y/hPh3T+THH7sRv4KjRHv+
	s27qXQOwpmh7zSbax5CogjvIZwuokzN2gEF5p4Gq5xmKarm59P9olAyMt8bVKHkOr+x8UzUPp7Q
	RryQCK8VjMrxEcZSqZdcVpzgPklo7oYM7Aub60SufJmyBbeGYOYFzLjis7x2a9k21U7M90NpI6P
	XZj3r7uMasOGhY9/oIvbuV1cjLcktC77DU7Gaj6NiV0+uLimlCWDWAzTZ8icstlqY7cq8myk+OR
	Jm96U4S+ZMFRPF74BwkbR7bnI1Uso1xW4P3rmz1UJWeeahoTUdqv+Jee5wLjbealfg0SnwBjSbN
	HdXF6vsNuT+US6XVdNqxE2xMyQCwn/cGO4KZ97M5npt9qDmhEk819iAO7fI89zrpzoDmPORzK/3
	unocPckfTdbveIY0+JcF/nRzUvV8x6FDj2IQU8sO5fBrxO8HuS42/BrO52vF0ghVjUNLs/gdMsb
	qGmG4csWzArF4+U9c6AXTZYjlysLaejKgO4p8ckO+vD1UxNlNUp/q2qltRLJRBOvr5YKET7SwnY
	C0ec3rMGjif6Pz2ZTgCIg0jUvMFtdlFZFUHS7BNYGYeA5ivHM9aDRUhQkE6QHQJ0VCnZx/1r8bs
	0Za5s4RcYljXXfV21SWEC/JnnudPsOjJD2izHSFyS2yDmBUdFiUfEoCQOCH4=
X-Received: by 2002:a17:90b:53cf:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b41c964af6mr3085892a91.48.1795186733253;
        Fri, 20 Nov 2026 06:58:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm4724705a91.17.2026.11.20.06.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:58:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 23:58:47 +0900
Message-ID: <20261120145847.3127774-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007032501.640372-1-yhlee@isslab.korea.ac.kr>
References: <20261007032501.640372-1-yhlee@isslab.korea.ac.kr>
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

On Wed, Oct 07, 2026 at 12:25:01PM +0900, Yehyeong Lee wrote:
> A target can finish a read without sending the data.  iscsi_tcp_data_in()
> bounds each Data-In PDU against the command buffer but never adds them up,
> so a completion that declares no underflow is believed and the command
> ends with DID_OK.  The pages keep whatever they held.

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
