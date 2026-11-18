Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006014;
	b=WnNVrbqTWhwrl6C2KO8B50cf3KROEBXgCai7vH3Yvgso8nqMmUnswRdOCAxaj4j5G3cq
	 Ck36NWwlm/Kix+eZGQqycvl5H5PiUvc67/wMIkWdQcy3mlG2SvT35+dMaAwtB+OEoumjN
	 qCFgv3aUgRbE3zT6fQnohki2eNlBe8EhvIiJJP7onU6WvbscMZTUI74AOTzfiyqP7TQY3
	 cQqCpLIDfo1whPxa9H1qbyGNsbeGqWUPS4wE93s6WIsqXtOGl5u6Lluc2vaglbfRoVAi2
	 sy1MuXwOkWMD+FbV+cxFrs1uWz/uIYhTDALZZXUE/VZoNpHDVEc4INAUe2fZ3JqcYaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006014;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GnW0DGN9umZ2ZPe8NX9ttfPkdxxYQUm5WmzEN0TBkyw=;
	b=l4Oizgji3YsFcklH0JQE9JXd00lDVrSWh3u4AT5v8naSj2DTjpmK5s51/k5SCmMBifeF
	 KRYaxqxExJoKQwKrU2mr6tH48Hu9XlDGot3mU9U+2dO/dUeCQgB4b2jC1lTAGV9feQqN2
	 g6cOEq23l+obfPzU12xlBkyUSxjQU6iFbWMWRxgUzCBfSNiXBiCC5s24nyunU9cpi3iYO
	 n9Kb+HhEQK5ZQ/01Yn2RH+hsnqV4exu4TBLorgw5CHkcMcAwuUZK9aoeMo36rKcWbOBiG
	 FStIyMTlO5umlxkRUuMM4B80CRfqyZDqOfco6vnBUfOZwu3X7gqcDM94h2bnBXtGmjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=tebb4fnq;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D03606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0D03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=tebb4fnq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795006011; x=1795265211;
	bh=GnW0DGN9umZ2ZPe8NX9ttfPkdxxYQUm5WmzEN0TBkyw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=tebb4fnq7ardpOpgBaalbX31+XQmatsUrvMH59Fs0Wf43hxGnGhwm4fQSKk75kCY+
	 rawfxzmwmf+rQIJ0sieEiXvU9I/ZYdrqdhQEAZ1LLtTd3FBGxPhYn//7PbQ2125ArJ
	 kGc1CQvfT/46j0kJnGCbwjzhvdvVxAr71pf63QELdGC+Qa6Qj0+YatgrLVPHyaTkBJ
	 nf7tJBAlKTPL2KsXqdauf/Iuyvn2YG8k59b2V7R+Co6akBg+zPP6Mp8QO3BgIfInpr
	 7NLX5DigYhFJmYY64OHqharBJkTQTb/lyUA0jLn1rR0JRTRYpod84qr8GvfvXIXzie
	 H1EvkfXVTzwXQ==
Date: Wed, 18 Nov 2026 12:46:45 +0000
To: Cooper Morgan <ext-github@cwooper.dev>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: Wayne.Lin@amd.com, oss@oysterdaisuki.com, harry.wentland@amd.com, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/amd/display: Fix FreeSync infopacket refresh rates above 255 Hz
Message-ID: <HftAWPKURVjBtK_2BmUiLXOb8ghZxaEzAJSg0tlsmy5L3ckJyDWc6g65vrsVGdA3ZcytB6mPuyxaQbsPawfOZmdC1dyAo4lCbaK3Tj7Tm-U=@protonmail.com>
In-Reply-To: <20261117183440.552477-1-ext-github@cwooper.dev>
References: <20261113010529.11514-1-ext-github@cwooper.dev> <20261117183440.552477-1-ext-github@cwooper.dev>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: 3e585c3816178facb6e494cafc8eb195ccbfea00
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Wayne, Cooper,

One more difference worth knowing about if v2 gets swapped in:
ae60ec4dcfc4 ("drm/amd/display: Use FreeSync v3 infopacket for sinks
above 255 Hz") is missing the amdgpu_dm_connector.c hunk of patch 2/2.
The posted patch changes four files (92 insertions, 1 deletion) in both
v1 and v2, but the commit only changes three (91 insertions).

The missing hunk is the one that stores the AMD VSDB version for every
DP/eDP sink:

=09get_amd_vsdb(amdgpu_dm_connector, &vsdb_info);
+=09amdgpu_dm_connector->vsdb_info.amd_vsdb_version =3D vsdb_info.amd_vsdb_=
version;

=09if (vsdb_info.replay_mode) {
=09=09amdgpu_dm_connector->vsdb_info.replay_mode =3D vsdb_info.replay_mode;
-=09=09amdgpu_dm_connector->vsdb_info.amd_vsdb_version =3D vsdb_info.amd_vs=
db_version;

Without it, a native DP sink without Replay never records VSDB v3, so it
never gets the v3 packet, and the DP side of the >255 Hz fix has no
effect. The KUnit test added by the same patch catches this on
amd-staging-drm-next 8dd68a79583a:

  # dm_test_fs_caps_dp_vsdb_version: EXPECTATION FAILED at drivers/gpu/drm/=
amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:9925
  Expected ctx->aconnector->vsdb_info.amd_vsdb_version =3D=3D 3, but
      ctx->aconnector->vsdb_info.amd_vsdb_version =3D=3D 0 (0x0)

The failure is easy to miss right now, because the amdgpu_dm KUnit run
panics earlier in dm_test_i2c_xfer_no_ddc_pin() (I've reported that on
the "Route connector DDC over AUX" thread). With that test fixed and
this hunk restored, all 1931 amdgpu_dm tests pass here. Patch 1/2
(bedad38a7ddf) landed complete.

Thanks,
Eren
