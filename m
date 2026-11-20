Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186831;
	b=wQFEMXPmdKqCae6Dm6yJfWsxjqP/HRg0+sFCRzn6Cc3NZd72OJWA+YohjPe2StS4NGUK
	 FL4Y3EE03h5zheWspDe5bLXwrkQJN+ghLTpGzW2yet4u/ERvCMZygRlwEejQEeNhZtSal
	 E78QSI3btBM7KdIu7atJqxvFs2aU1OQ2bMhbREen/VIePJkrwy6jN3UJ0SM30Z5QgmmNW
	 IRZmYev3tg5HKUTPtJxuz+kZH6+PpkQJTrQ53wRULblkZGFvtJPByPEWkPoheBtWJDBnh
	 mXuNP7A9GcxwRMvhBvhTt6rqFlgVdOtdhMnYNIx4YagqVwDxCEKdNluAj7ihejLfj6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kg7NQpidoTuedvwQ4J1hfzPeomwwjR6JA06ZZj6FI/A=;
	b=2rv2Lh85WWja/41yXPqMh7sPz/UxddYy2U4NnnIl3i0UZx+UlDFadE2SOEQKJcVLr8NY
	 aSYzasJbnZiAibh/+SK7Rl9mVTqyz0oAiyTRi0Gc8skWtOevz5U+76rC/0WQfKFSO5aAS
	 /P9P/fcpCPPXqcPJpD0gOa9a2ewzfs3cd9ZluiB8DK7BpC2wYJju4kWUjw3AhtGjwee0j
	 3z3ztWgLMVr/NjjInHif1Tm+r6QumuYcnwGJIG4LZNsDCphquk1UGpkWc4md6xHC0kuAi
	 URGWoWo97VdQtzT9zAOoEPDTzCHyMlk5VdAkg5cKsYHg+It0HBVyIAs60g/G5PdHyvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lx4VfNRz;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF0606A82A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FF0606A82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lx4VfNRz
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so624433b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186830; x=1795791630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kg7NQpidoTuedvwQ4J1hfzPeomwwjR6JA06ZZj6FI/A=;
        b=Lx4VfNRzywUVvQC1HshGOmmIJ3yT9uPLWlhGQCEtBxYcKQnW7vUnavieMkZOclSzzH
         LrMtfPouH3p7sJGvXudbf4OCe1WrNpqM6Ox7xUWgUoxQRAyGmeenVY+XcDl/8Sx6JU6+
         Ur9lboTFER8/6uDaIkgSkyZ4ve0ZVqg7NeBmCGB0lgHlVx30h3X+meqy14wtKXJ1lZsz
         +fPYgl81CMPdQPi9S+md6IfrPS1E3gY2ToUfkMNbsUt+nE8htWgEg+xF9bFTMICuGmnh
         votFLb4Sh9/r1PLhg0TeC8wFrVe0vK6hHxrQtweCMrE7R1ARrsGMu2Vkd8U4ZcqYWXdM
         7ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186830; x=1795791630;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kg7NQpidoTuedvwQ4J1hfzPeomwwjR6JA06ZZj6FI/A=;
        b=DOO4Nh8vrhyv+xsTRZ8nXKVVLo97+rd0f3k7obJ5IRszLEkQedzp0ftzBoQ7EiD4f7
         2a8XWPHZcKvt4R2EktHaI7xy27wMoDY3s1D8y3eDEF8dVOiZQP6gGVhbyq9zKOEJxlTJ
         xH+GrY7pSgtKMAYS8wo6d06QpkUII9vr4qtsuXtYh89/u9n/yUOqA2AzvMbAxGakw0X4
         cvahB6OdNvH5CEh/Dtsi4TH2u+WLyD4T6P7/C43rd7V3I80ISKEsh1GL6jqdvAoWAUm1
         o+TFqkpDL/zOVYqBHmBf/yVQYM6ICocisMpntEV9ZAuB+PVvoVf71IiySpvm4Lg5PiJy
         jIeg==
X-Forwarded-Encrypted: i=1; AL+hErG3p53PLbYvV2Xf7nerMoHI3BE4fUFVPEMaDjCccbK137/lKIN/A+pzb8Pl13jEdk+KHYOVfrjwLAwS2B8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EtEtjCCo4CdjuE7Y5Vnq+MfDLpa1OQGyS/N9Kl3Czavm0Dwhs
	HjsHKi73395bEUEu18ZA/jsfrN01ED6LLuK57tEUaQqKu5t1ZQkG832yzqvOZOXyGCoDEktoa2G
	uMvZe0xQ=
X-Gm-Gg: AZFdTZfSr2JuXdI0uXbE2V0r6LfKd4u4tmK3jHMIxgVs436fH2DDW89wRhnMOg5amMT
	kiiq1zeNgykoGCPuBUDY3YPAWijUNT2BpOzWkdDm9xO5bPns9pW8xkFkTQTneFuBPird3vfo8am
	xuEm8UlxGJsIMZnOEKBpuc4IQttF7jN2wubHNmRW4mMks8odnOzQE94ehHux4fZTPBH7X/5g4Lt
	ZSfYCT0lcumkSIVkqG1kHGM8BKmCxQvq//CJVufiLyXKZM15cSOdgMhXBt3loBy7/xTkBK3CMCf
	oMGmONwV+Kb39OybusU3EkKrUQjOJUOKiJFQS6q6g574jEtoGIjLHSMDBC9wzvhwl2Q656ViEuQ
	+nB/5L8XTSKjR97Y0mJ82VKuZ44IzFd1dGEIItxM6wTdoiBBh2Dl625xFXq4E4XxFNVjbKymDzS
	Os8u/S9hSlDxAuU2ED1KhSlHdorUGWaOQlyHVk53CPJi3h4e9C3oFm0x92u+f6mZYTCXK/OR31/
	ppMn9hG4J8h0A0K79GsBfQyAwEUF8ijMP7KzNlKH+YIMsbXmfxdsvsh/qGpC97vrfHr95uRnPh/
	edkCHpDSee2L70vuy4cwpRFxfXBXOORGtGUlcyCf4mNTCa0A8hy3zd6Q7I3t+Gh8PeHkkK7tGpq
	//A03WSLNIT6I13wCaPHaeicgg+rsSWfqIOUV
X-Received: by 2002:a05:6a00:27a7:b0:89f:52ae:612e with SMTP id d2e1a72fcca58-8c87d516fc7mr1969039b3a.25.1795186830605;
        Fri, 20 Nov 2026 07:00:30 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bc47sm1697153b3a.6.2026.11.20.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:29 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] scsi: mvumi: bound the values the firmware supplies
Date: Sat, 21 Nov 2026 00:00:24 +0900
Message-ID: <20261120150025.3128175-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
References: <20261014162413.3649841-1-yhlee@isslab.korea.ac.kr>
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

On Thu, Oct 15, 2026 at 01:24:08AM +0900, Yehyeong Lee wrote:
> This supersedes

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
