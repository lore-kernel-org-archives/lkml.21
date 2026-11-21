Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795241722;
	b=1YT/O8JwSD2OGFvgW9o+UInE7KfscVPmApIiKdvqDO3Qm79jai7b4vLEy24OKEbuAXqr
	 OagOk2cJ5yBXZ9SL7coWSWtz7zxOHRsxUDrqlIRVgRvanMJpun5oosuyYO/aHX3besS9o
	 6JA4c1zd5dsOcxoJPgzLpOALShhD+EBrDLdFhFXNq5lhc+oZ/t71Stp9oKWmjDeqngzix
	 871FNBhkfQPy5xHk+cGCFftXf0OehH75anuKiEgNKUv2RSish9E2ueICMtqopy6Bro7Yl
	 IAni+535CDVReMwVOJyVRRDidC6qfAZwbLqmRcTdheAA+Op+OpHO/Xa9EEYnk78efGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KpzYn0GzUFdnPwdqQHx2vxNDfinxrzoJcs9m7k9ETRM=;
	b=pD4dMsO3dM33tKGyxXz2tYszlQdKCYomFAFS2qInYjDOHpjDdwJ19smxHD03EQP1jrcF
	 3TUQ5pAig+T8CMFz9LpydLxvAWfglR8btdPknjPIiH54gPlfWDi9VVI53iUDttw3VLhmm
	 Cj+d6kVY+FiyQdzYpq0Ri7pYiFWgZ7RGVYJApKFbTiTHGNcZPfXE7LjNhSLnKs9F3c+rk
	 I7gRn1rqQBUV3zv2ikojFc4uzkauA3XzNY0/i7/mdbK3d5KNrhNlRVC60yK9K+SlcRHVs
	 l4tvLShJFxmYiYy4xZSnB/xhV8EjRle6AZywU6bFIQION7vLURmt/QO4HM/9FhyAGXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6OcvCus;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A6606A333
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246A6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6OcvCus
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so1934204eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795241720; x=1795846520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpzYn0GzUFdnPwdqQHx2vxNDfinxrzoJcs9m7k9ETRM=;
        b=Q6OcvCusnBIZj+BBfYIVJrPJvtm8T37PbeSyYZi3g0/0e+gSrUz/l19XY19K3dLMDU
         KGwhNfAQnNjuH2YAOxn+NKyAnpUmmXz/zrPmJzAUPq/WQDnFPaaW/gcI6H90P9uKFecq
         WFBBWnySw/4ZFxF4UA6gN3AM0f47hy/LKUARggPC8ZVGmUs/lWjOIs6yB+wUR8GWMsCW
         Rc5T9Ge/ZdroWn2BVCsIH/CeB2uC3ZBDc2Llh4XLrR3jfrnTS/SKDRmEdd+M5A7duNJ3
         nZZKLzqJTtQjgpD9IxucLVwX4iv82GR5JBc0gZl1Byau2CY4Y0zC5/PTnU+KU1dnU5nm
         2cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795241720; x=1795846520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpzYn0GzUFdnPwdqQHx2vxNDfinxrzoJcs9m7k9ETRM=;
        b=MLWJu6Xk7i8xj/k36378EBrb7I4qtm+qV1yDyQl+10OQwndcenv4/aPjr8uxMGHN5L
         yQgXXhG7MnYr1YKwISft1vHQtApCQDtMHV0eOqcvcBCLm1wMxjVD+HNPooGi9vAuq5VD
         aaRMW1n6sWEO74gCs9bYmuVL0NZAh4895Damx4b+rJJrEfl+NDbeNJoyfCE934ctL1Xm
         KoYEwr9C4cjurrWFe1cBUVM8EBdpQgiJrgP8ngrP7Z18s71+Z+O30cy+WE7RPjw45y1E
         Hdn7Qx8lY8MXI4D/eWAVPM5tavALbKYNddSpzZzORP+CaROnQXYrqy3NzL/hMZQJ5LyE
         tn9w==
X-Forwarded-Encrypted: i=1; AL+hErGNVoxqORY+C2zpa0WeLYtYiUHyv2c0BfjXPo0jET+TqLxN7G/vYPUelAEJU94e0aXxWhs0yBXYuiUOr7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PB2Df2Fzu7XoLYCrQEazUG91m9W3xloaXN4v/B0lIzoDLN4RX
	ZMzmM7hXJB0Of/18N2k+e+LBv516uhNaWuGdx402GXVUnn2BenBPDYKF
X-Gm-Gg: AZFdTZfPi29FfLVIgg0jsIIs6AEhygt2DANBUiP6ipms0Cd/6/PeZZuEbn5CNUi27Cr
	gK4z+tXn0v3Mv2xjxKOU3eqVxeUKThj9PuMQu7E4ncgRooTNafQKbh+hUq1w1EYoqIPHRLafdkr
	wh1+DQdaF2F7kmsnxw7HeS9PtHQN/dv9cgnXciSk+FzHC5IKn48tBapRF4+beDZuyGH7Lrckd0v
	77j6REdwLAZq11YBrPh8PBTFIvY3Eq97nXNxwZawV87cBngmatbVn5nZONpBBsfuFyhG5gXhfzm
	myxskuYNl2j89GR0cfgk4zPp0mW3B2upvN6zM138/eL9PS8KPgWK9DJLemqYEX29cNy6v4uOUi7
	bKRGUmV5vReaQf/NeqjuU0WuTkVHveJPOsFeVEBByjb5gSOCfb2HQTiyOYVPBwfEPEts60em++f
	J+LhjW4W9yB8MYOrylUzhA715vSk6LjpJ1Vh0M/o+HsCDZMiFudVgP2n1vNLD1FMmfznRuw0C+O
	CwJp9irHXGLd0SY1/xmMe59WW1B8PWmDahciPJW9btdE1vkxT8alrRGkOySADQZXt9LO0A7WESJ
	XHSf1qU+OGQFqeL9NNVF
X-Received: by 2002:a05:7301:6083:b0:386:a01f:a36b with SMTP id 5a478bee46e88-386a01fa8d8mr298090eec.35.1795241720086;
        Fri, 20 Nov 2026 22:15:20 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385616f0a3fsm13054023eec.0.2026.11.20.22.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 22:15:19 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] drm/amd/display: Document the return values of the dc_update_state helpers
Date: Sat, 21 Nov 2026 06:15:16 +0000
Message-ID: <20261121061516.1830533-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

kernel-doc -Wall reports:

  dc.h:2175 No description found for return value of
  'dc_update_state_prepare'
  dc.h:2190 No description found for return value of
  'dc_update_state_cleanup'

Both functions return bool and their comments explain in prose what the
caller must do next, but neither has a Return: section, so kernel-doc
asks for one.  Move the explanation into a Return: section and say when
the scratch slot is released.

No functional change.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran kernel-doc on the file with and without the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index d3c484f45333..231a8ca2b18a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -2170,8 +2170,8 @@ struct dc_update_scratch_space *dc_update_state_init(
  * dc_update_state_prepare - Prepare the commit under the global lock.
  * @scratch: commit scratch from dc_update_state_init()
  *
- * On failure the scratch slot is released and false is returned; the caller
- * must not call execute or cleanup.
+ * Return: true on success, false on failure. On failure the scratch slot has
+ * already been released, so the caller must not call execute or cleanup.
  */
 bool dc_update_state_prepare(struct dc_update_scratch_space *scratch);
 
@@ -2185,8 +2185,11 @@ void dc_update_state_execute(const struct dc_update_scratch_space *scratch);
  * dc_update_state_cleanup - Finalise the commit and release the scratch slot.
  * @scratch: commit scratch from dc_update_state_init()
  *
- * Must be called with the global lock held. Returns true if the caller must
- * loop back to prepare (SEAMLESS continuation).
+ * Must be called with the global lock held.
+ *
+ * Return: true if the caller must loop back to prepare (SEAMLESS
+ * continuation), false otherwise; the scratch slot is released before false
+ * is returned.
  */
 bool dc_update_state_cleanup(struct dc_update_scratch_space *scratch);
 

base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

